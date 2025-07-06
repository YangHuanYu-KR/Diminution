#!/usr/bin/env zsh
#===============================================================================
# Filename: MPD_solve_zsh
# Purpose: Run Incmode_solver.py under zsh and enable Tab-completion for
#          --lp_dir, --domain, and other path-related options.
# Note: This script only supports zsh and uses zsh-native compinit + compdef
#       to implement command-line completion.
#
# Usage:
#   1. Make the script executable:
#        chmod +x MPD_solve_zsh.sh
#   2. Source the script in your current shell to load completions:
#        source ./MPD_solve_zsh.sh
#   3. Run the script with arguments, for example:
#        ./MPD_solve_zsh.sh --domain MPD/MPD_demo --index 1 --models 0 --verbose
#===============================================================================

# ----------------------------
# STEP 0: Initialize zsh completion system (required)
# ----------------------------
autoload -U compinit && compinit

# ----------------------------
# STEP 1: Locate the directory where this script resides
#   ${(%):-%x} in zsh is equivalent to ${BASH_SOURCE[0]} in bash, allowing
#   the script to determine its own location whether sourced or executed.
# ----------------------------
script_dir="$(cd "$(dirname "${(%):-%x}")" && pwd)"

# ----------------------------
# STEP 2: Invoke the Python solver script
#   Assumes Incmode_solver.py is in the same directory as this shell script
# ----------------------------
python3 "$script_dir/Incmode_solver.py" "$@"

# ----------------------------
# STEP 3: Define zsh-native completion function
#   Use _arguments and _files to handle “option → path” completion logic
# ----------------------------
_mpd_completions() {
  # Ensure $words, $CURRENT, and $state are available
  local context state line
  typeset -A opt_args

  # Use _arguments to define completion rules for each option in one step
  _arguments -s \
    '--domain=[Specify the domain directory, e.g., MPD_demo/]:directory:_files -/' \
    '--index=[Instance index, e.g., 1, 2, 3…]:number: ' \
    '--models=[Limit number of models (0 for no limit)]:number: ' \
    '--verbose[Enable verbose output (no additional argument)]' \
    '--related[Use MPD_solve_related.lp to solve. (no additional argument)]' \
}

# ----------------------------
# STEP 4: Bind the completion function to this script name
# ----------------------------
compdef _mpd_completions MPD_solve_zsh.sh