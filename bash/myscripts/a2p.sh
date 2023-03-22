#!/bin/bash

echo "Enter the directory you want to add to PATH: "
read -r addeddir
echo "export PATH=\$PATH:\"$addeddir\"" >> ~/.bashrc
source /home/$USER/.bashrc
echo "The directory $addeddir has been added to PATH"
echo "Current PATH: $PATH"
