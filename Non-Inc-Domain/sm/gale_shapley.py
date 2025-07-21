import os
import random

# random.seed(0)


def gale_shapley(men_preferences, women_preferences):
    """
    Men proposing to women
    """
    # Number of men and women
    N = len(men_preferences)

    # Each man is free at the start
    free_men = list(range(N))

    # Initialize the current partner for each man and woman
    current_partner = [-1] * N  # -1 means no partner
    women_partner = [-1] * N     # -1 means no partner

    # While there are free men
    while free_men:
        man = free_men.pop(0)  # Get the first free man
        man_pref = men_preferences[man]

        # Propose to the highest-ranked woman he hasn't proposed to yet
        for woman in man_pref:
            if women_partner[woman] == -1:  # If woman is free
                # Engage man and woman
                women_partner[woman] = man
                current_partner[man] = woman
                break
            else:
                # If woman is already engaged, check if she prefers the new man
                current_man = women_partner[woman]
                woman_pref = women_preferences[woman]

                if woman_pref.index(man) < woman_pref.index(current_man):
                    # Woman prefers the new man
                    women_partner[woman] = man
                    current_partner[man] = woman
                    # The dumped man becomes free
                    free_men.append(current_man)
                    current_partner[current_man] = -1
                    break

    return current_partner, women_partner


def manAssignsScore(man, woman, score):
    return (man, woman, score)


def womanAssignsScore(woman, man, score):
    return (woman, man, score)


def translate_scores_to_preferences(men_scores, women_scores):
    # Determine the number of men and women
    men_count = max(score[0] for score in men_scores) + 1
    women_count = men_count

    # Initialize preference lists
    men_preferences = [[] for _ in range(men_count)]
    women_preferences = [[] for _ in range(women_count)]

    # Fill preference lists based on scores
    for score in men_scores:
        men_preferences[score[0]].append((score[1], score[2]))  # (woman, score)
    for score in women_scores:
        women_preferences[score[0]].append((score[1], score[2]))  # (man, score)

    # Sort preferences by score (higher score first)
    for man in range(men_count):
        men_preferences[man].sort(key=lambda x: -x[1])  # Sort by score descending
        men_preferences[man] = [woman for woman, score in men_preferences[man]]  # Keep only women

    for woman in range(women_count):
        women_preferences[woman].sort(key=lambda x: -x[1])  # Sort by score descending
        women_preferences[woman] = [man for man, score in women_preferences[woman]]  # Keep only men

    return men_preferences, women_preferences


def generate_random_preferences(num):
    rand_men_scores = []
    rand_women_scores = []

    # Generate scores for men
    for man in range(num):
        # Unique scores for women from 1 to num
        women_scores = random.sample(range(1, num + 1), num)
        for woman in range(num):
            rand_men_scores.append(manAssignsScore(man, woman, women_scores[woman]))

    # Generate scores for women
    for woman in range(num):
        # Unique scores for men from 1 to num
        men_scores = random.sample(range(1, num + 1), num)
        for man in range(num):
            rand_women_scores.append(womanAssignsScore(woman, man, men_scores[man]))

    return rand_men_scores, rand_women_scores


def create_renaming_mapping(men_partners):
    # Create a mapping for renaming women
    women_renaming_mapping = {}

    for man_index, woman_index in enumerate(men_partners):
        women_renaming_mapping[woman_index] = man_index

    return women_renaming_mapping


def renaming_original_scores(original_men_scores, original_women_scores, women_renaming_mapping):
    men_count = max(score[0] for score in original_men_scores) + 1
    women_count = men_count

    renamed_men_scores = []
    for score in original_men_scores:
        renamed_men_scores.append(
            manAssignsScore(score[0], women_renaming_mapping[score[1]], score[2])
        )
    renamed_men_scores.sort(key=lambda s: s[0] * men_count + s[1])

    renamed_women_scores = []
    for score in original_women_scores:
        renamed_women_scores.append(
            womanAssignsScore(women_renaming_mapping[score[0]], score[1], score[2])
        )
    renamed_women_scores.sort(key=lambda s: s[0] * women_count + s[1])

    return renamed_men_scores, renamed_women_scores


def generate_instances(scores, mode):
    """
    write instance files wit the scores after renaming,
    choose mode between 'm' (for men) and 'w' (for women)
    """
    if mode == 'm':
        prefix = 'manAssignsScore'
    elif mode == 'w':
        prefix = 'womanAssignsScore'
    else:
        raise RuntimeError('Please choose mode = m or w')

    str_score_list = []
    for score in scores:
        str_score_list.append(
            f'{prefix}({score[0]}, {score[1]}, {score[2]})'
        )

    return str_score_list


def write_instance_file(men_scores, women_scores, instance_index=1):
    meta = f'% number of men/women = {max(score[0] for score in men_scores) + 1}\n'
    str_men_scores = '.\n'.join(generate_instances(men_scores, mode='m') + ['% end of men'])
    str_women_score = '.\n'.join(generate_instances(women_scores, mode='w') + ['% end of women'])

    if not os.path.exists(f'./{instance_index}/'):
        os.mkdir(f'./{instance_index}/')
    instance_file = f'./{instance_index}/instance.lp'
    with open(instance_file, 'w') as f:
        f.write(meta)
        f.write(str_men_scores)
        f.write(str_women_score)


if __name__ == '__main__':
    import argparse

    import numpy as np

    def parse_args():
        p = argparse.ArgumentParser(
            description="Generate Stable Marriage instances")
        p.add_argument("--index",
                       type=int,
                       help="instance index, the file will be at sm/<index>/instance.lp")
        p.add_argument("--num",
                       type=int,
                       help="the number of men/women")
        p.add_argument("--seed",
                       type=int,
                       default=0,
                       help="random seed")
        return p.parse_args()

    args = parse_args()

    random.seed(args.seed)

    num = args.num
    rand_men_scores, rand_women_scores = generate_random_preferences(num)

    print("\n --- Original random instances (as scores), first 20 ---")
    print("Men's scores:\n", np.array(rand_men_scores[:20]))
    print("Women's scores:\n", np.array(rand_women_scores[:20]))

    # # Example (wo)manAssignScore predicates
    # scores = [
    #     [
    #         manAssignsScore(0, 0, 3),
    #         manAssignsScore(0, 1, 2),
    #         manAssignsScore(0, 2, 1),
    #         manAssignsScore(1, 0, 2),
    #         manAssignsScore(1, 1, 3),
    #         manAssignsScore(1, 2, 1),
    #         manAssignsScore(2, 0, 1),
    #         manAssignsScore(2, 1, 2),
    #         manAssignsScore(2, 2, 3),
    #     ],
    #     [
    #         womanAssignsScore(0, 0, 3),
    #         womanAssignsScore(0, 1, 1),
    #         womanAssignsScore(0, 2, 2),
    #         womanAssignsScore(1, 0, 2),
    #         womanAssignsScore(1, 1, 3),
    #         womanAssignsScore(1, 2, 1),
    #         womanAssignsScore(2, 0, 1),
    #         womanAssignsScore(2, 1, 2),
    #         womanAssignsScore(2, 2, 3),
    #     ]
    # ]

    men_preferences, women_preferences = translate_scores_to_preferences(
        rand_men_scores, rand_women_scores
    )

    print("\n --- Corresponding preferences, first 20 ---")
    print("Men's preferences:\n", np.array(men_preferences[:20]))
    print("Women's preferences:\n", np.array(women_preferences[:20]))

    # # Example array representation
    # men_preferences = [
    #     [0, 1, 2],  # Man 0 prefers Woman 0, then Woman 1, then Woman 2
    #     [1, 0, 2],  # Man 1 prefers Woman 1, then Woman 0, then Woman 2
    #     [2, 1, 0]   # Man 2 prefers Woman 0, then Woman 2, then Woman 1
    # ]
    # women_preferences = [
    #     [0, 1, 2],  # Woman 0 prefers Man 0, then Man 1, then Man 2
    #     [1, 0, 2],  # Woman 1 prefers Man 1, then Man 0, then Man 2
    #     [2, 1, 0]   # Woman 2 prefers Man 2, then Man 1, then Man 0
    # ]

    men_partners, women_partners = gale_shapley(men_preferences, women_preferences)

    print("\n--- Gale-Shapley matching results ---")
    print("Men's partners:", men_partners)
    print("Women's partners:", women_partners)
    print("Renaming women:", create_renaming_mapping(men_partners))

    renamed_men_scores, renamed_women_scores = renaming_original_scores(
        rand_men_scores, rand_women_scores, create_renaming_mapping(men_partners)
    )

    write_instance_file(renamed_men_scores, renamed_women_scores, instance_index=args.index)

    print("\n--- Transformed instances (after renaming), first 20 ---")
    print("Men's scores:\n", np.array(renamed_men_scores[:20]))
    print("Women's scores:\n", np.array(renamed_women_scores[:20]))

    print("\n--- Gale-Shapley matching (after renaming) ---")
    men_partners, women_partners = gale_shapley(
        *translate_scores_to_preferences(renamed_men_scores, renamed_women_scores)
    )
    print("Men's partners (after):", men_partners)
    print("Women's partners (after):", women_partners)

    print(f'\n *** Instance generated successfully at sm/{args.index}/instance.lp ***')
