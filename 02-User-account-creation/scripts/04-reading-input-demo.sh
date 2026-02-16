#!/usr/bin/env bash


# This script creates an account on the local system.
# You will be prompted for the account name and password.


# Ask for the username.

read  -p 'Enter the username to create: ' USER_NAME

# Ask for the real name.

read -p 'Enter the real name of the user: ' COMMENT
# Ask for the password
read -p 'Enter the password to use for the account: ' PASSWORD

# Create the user
id -un ${USER_NAME} &>/dev/null || sudo useradd -c "${COMMENT}" -m ${USER_NAME}

# Set the password for the user
# sudo passwd ${USER_NAME} --stdin <<< ${PASSWORD}
sudo passwd ${USER_NAME} --stdin ${PASSWORD}

# Force password change on first login
sudo passwd -e ${USER_NAME}
