#!/usr/bin/env bash

# This script displays various information to the screen.

# Display Hello
echo "Hello"

# Assign a value to a variable
WORD='script'

# Display the value of the variable
echo "$WORD"

# Demostrate that single quotes prevent variable expansion
echo '$WORD'

# combaine the variable with hard coded text
echo "This is a $WORD"
echo "This is a ${WORD} demo"

# Append text to the variable
echo "This is a ${WORD}ing demo"
echo "${WORD}ing is fun!"

# Show how NOT to apopend text to a variable
# This doesn't work
echo "$WORDing is fun!"

# Create a new variable
ENDING='ed'

# Combine the two variables
echo "${WORD}${ENDING}."

# Cahnge the value stored in the ENDING variable
ENDING='ing'

echo "${WORD}${ENDING}."

# Reassign the value to ENDING
ENDING=''
