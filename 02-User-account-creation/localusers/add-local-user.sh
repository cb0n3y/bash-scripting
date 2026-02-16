#!/usr/bin/env bash

if [[ ${UID} -ne 0 ]]; then
  echo "Please run with sudo or as root."
  exit 1
fi

read -p 'Enter the username to create: ' USER_NAME
read -p 'Enter the real name of the user: ' COMMENT
read -s -p 'Enter the password for the user: ' PASSWORD
echo

# Create user if not exists
if ! id "${USER_NAME}" &>/dev/null; then
  useradd -c "${COMMENT}" -m "${USER_NAME}"
fi

echo "${USER_NAME}:${PASSWORD}" | chpasswd
echo "The password for the account was set successfully."

# Force password change on first login
passwd -e "${USER_NAME}"
# chage -d 0 "${USER_NAME}"
# Note:
# I keep getting the eeror:
#
# [vagrant@localusers ~]$ su - einstein
# Password:
# You are required to change your password immediately (root enforced)
# Changing password for einstein.
# (current) UNIX password:
# su: Authentication token manipulation error


echo
echo "The account was created successfully."
echo "${USER_NAME}:${PASSWORD}@$(hostname -f)"
