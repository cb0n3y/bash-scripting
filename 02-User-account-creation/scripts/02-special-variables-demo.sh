#!/usr/bin/env bash

# Display the UID and username of the user executing the script.
# Display if the user is the root user or not


# Display the UID

echo "Your UID is: ${UID}"

# Display the username

echo "Your username is: ${USER}"

# Note that id and whoami are external commands, so they are slower than using the built
# in variable $USER. However, they are more reliable because they will always return the
# correct username, even if the $USER variable is not set or is set to an incorrect value.
# Also note the syntax. Te external commands are enclosed in () and preceded by a $ sign.
# This is called command substitution and it allows the output of the command to be used
# in place of the command itself.
# or
echo "Your username is: $(id -un)"
# or
echo "Your username is: $(whoami)"

# This is the older syntax and is not recommended because it can be confusing and is less
# readable than the newer syntax.
# USER_NAME=`id -un`
# echo "Using the old syntax, your username is: `id -un`"
#
# New syntax
# Rule of thumb: Use $(...) for command substitution. Only use backticks if you’re
# writing super-old scripts for legacy systems.
USER_NAME=$(id -un)
echo "Using the new syntax, your username is: ${USER_NAME}"

echo "Your username is: ${USER_NAME}"

# Display if the user is root or not

echo "Is the user root?"
 if [[ ${UID} -eq 0 ]]; then
  echo "yes, you are root"
else
  echo "no, you are not root"
fi
