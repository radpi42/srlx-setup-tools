#!/bin/bash
read -p "Enter alias: " alias
read -p "Enter the command for the alias: " aliascmd
cat << EOF >> ~/.bash_aliases
alias $alias="$aliascmd"
EOF
echo "alias added to .bash_aliases file."
source ~/.bashrc
echo "aliases activated"