#!/usr/bin/env bash
set -e

show_menu() {
  echo
  echo "========== GIT PRACTICAL COMMAND HUB =========="
  echo "1. Program 1 - Setup and Basic Commands"
  echo "2. Program 2 - Creating and Managing Branches"
  echo "3. Program 3 - Git Stash"
  echo "4. Program 4 - Clone a Remote Repository"
  echo "5. Program 5 - Fetch and Rebase"
  echo "6. Program 6 - Merge with a Custom Message"
  echo "0. Exit"
  echo "================================================"
}

while true; do
  show_menu
  read -rp "Choose a program (0-6): " choice
  case "$choice" in
    1) cat <<'EOF'
# Program 1 - Setup and Basic Commands
git --version
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
mkdir GitLab1
cd GitLab1
git init
echo "Hello Git" > sample.txt
cat sample.txt
git status
git add sample.txt
git status
git commit -m "Initial commit"
git log --oneline
EOF
       ;;
    2) cat <<'EOF'
# Program 2 - Creating and Managing Branches
git branch -M master
git switch -c feature-branch
git branch
echo "Login feature added" >> sample.txt
git add sample.txt
git commit -m "Add login feature"
git switch master
git merge feature-branch
git log --oneline --graph --all
git branch -d feature-branch
EOF
       ;;
    3) cat <<'EOF'
# Program 3 - Git Stash
git switch feature-branch
echo "Work in progress" >> sample.txt
git status
git stash push -m "Temporary feature work"
git stash list
git switch master
git switch feature-branch
git stash apply stash@{0}
git status
git stash drop stash@{0}
# Note: normal stash excludes untracked files; stage them first or use git stash push -u.
EOF
       ;;
    4) cat <<'EOF'
# Program 4 - Clone a Remote Repository
git clone https://github.com/USERNAME/PROJECT.git
cd PROJECT
ls
git remote -v
git status
git log --oneline
# Replace the example URL and folder name with your repository.
EOF
       ;;
    5) cat <<'EOF'
# Program 5 - Fetch and Rebase
cd PROJECT
git branch -a
git switch feature-branch
git fetch origin
git rebase origin/master
# If the remote default branch is main, use: git rebase origin/main
# After resolving a conflict:
git add <filename>
git rebase --continue
# To cancel an ongoing rebase: git rebase --abort
git log --oneline --graph --all
EOF
       ;;
    6) cat <<'EOF'
# Program 6 - Merge with a Custom Message
git switch feature-branch
echo "Payment feature added" >> sample.txt
git add sample.txt
git commit -m "Add payment feature"
git switch master
git merge --no-ff feature-branch -m "Merge feature-branch into master"
git log --oneline --graph --all
EOF
       ;;
    0) echo "Good luck with your practical!"; exit 0 ;;
    *) echo "Please enter a number from 0 to 6." ;;
  esac
  echo
  read -rp "Press Enter to return to the menu..."
done
