#!/bin/bash
read -p "Enter the directory to add to PATH: " pdir
cat << EOF >> ~/.bashrc
export PATH="$pdir:$PATH"
EOF
echo "directory added to path. log out and back in to activate"
