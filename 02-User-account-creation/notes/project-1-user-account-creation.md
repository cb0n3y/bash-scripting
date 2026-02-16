# Project 1 - User Account Creation

---

## Getting Started with Shell Scripting

Comments can be add to the bash script using `#`.
It is a good practice to place a comment right after the **shebang** line, describing what the script does.
This helps you or anyone else working with the script to quickly understand its purpose.

---

## Key Topics for Project 1

- Naming
- Permissions
- Variables
- Builtins
- Special Variables
- Pseudocode
- Command Substitution
- `if` Statement
- Conditional
- Exit Statuses
- Return Codes
- String Test Conditional
- More Special Variable
- Reading Standard Input
- Creating Accounts
- Username conventions
- More Quoting

---

## Examples

### Naming

In Bash scripting, **choosing clear and consistent names** for your scripts, variables, and functions is crucial. Good naming improves readability and maintainability, especially when scripts grow or are shared with others.

---

#### Script Naming

- Use **lowercase letters** and **hyphens or underscores** to separate words.
  ```bash
  create-user.sh
  manage-accounts.sh
  ```
- Avoid spaces or special characters in filenames.
- Add a descriptive prefix if needed, e.g., proj1- for project 1 scripts:

```bash
proj1-add-user.sh
proj1-delete-user.sh
```


---

### Permissions

In Linux, **permissions** control what actions a user can perform on files or directories.
Permissions are represented as **rwx** (read, write, execute) for **three levels**:

1. **User (u)** – the owner of the file
2. **Group (g)** – users in the file’s group
3. **Others (o)** – everyone else

Permissions can be modified in **symbolic** form or **octal** form:

- **Symbolic**:
In Linux, permissions are rwx (read, write, execute) for three levels: user, group, others.
Those permissions can be given in `octal mode 421` or u+rwx,g-rwx and so on.

```bash
# Add execute permission for the user
chmod u+x luser-demo01.sh

# Remove write permission for group
chmod g-w luser-demo01.sh

# Give read permission to others
chmod o+r luser-demo01.sh
```

- **Octal**: each permission is represented by a number

| Permission  | Octal Value |
| ----------- | ----------- |
| read (r)    | 4           |
| write (w)   | 2           |
| execute (x) | 1           |

Example:

```bash
# rwx for user, r-x for group, r-- for others → 754
chmod 754 luser-demo01.sh
```

**Tip**: You can check current permissions with:

```bash
ls -l luser-demo01.sh
```

Output example:

```bash
-rwxr-xr-- 1 cb0n3y users 123 Feb 15 12:00 luser-demo01.sh
```

- First trio (rwx) → user permissions
- Second trio (r-x) → group permissions
- Third trio (r--) → others permissions

---

### Variables

- Variables store data for later use. **Important:** No spaces around `=` when assigning a value.

```bash
USERNAME="devops"
PASSWORD="Secure123!"
echo "$USERNAME"
```

For a full working example of variables and how to combine them, see the script:
[View the script here](../scripts/01-variables-demo.sh)

- Variable names can contain:

  - letters (`a-z`, `A-Z`)
  - digits (0-9)
  - underscores `_`

- They can start with:

  - letters or underscores
  - but CANNOT start with a digit.

Examples:

```bash
WORD    # valid
_WORD   # valid
3WORD   # invalid
A-WORD  # invalid
```

**Tip**: Always use meaningful variable names to improve readability.

For more information about naming conventions, visit: [Naming Conventions](https://google.github.io/styleguide/shellguide.html#naming-conventions)

---

### Builtins

Common Bash builtins include echo, read, printf, test, exit, etc.

```bash
echo "Hello, world!"
```

---

### Special Variables

These are predefined in Bash. Examples:

```bash
$0  # script name
$1  # first argument
$#  # number of arguments
$?  # exit status of last command

# Built-in variable for current user
echo "Your username is: ${USER}"

# External commands (slightly slower but more reliable)
echo "Your username is: $(id -un)"
echo "Your username is: $(whoami)"
```

**Note:**
- `${USER}` is a Bash built-in variable, so it’s very fast, but it can be overwritten.
- `id -un` and `whoami` are external commands; they are slightly slower but always return the correct username, even if `$USER` has been modified.
- Also note the syntax. Te external commands are enclosed in () and preceded by a $ sign. This is called command substitution and it allows the output of the command to be used in place of the command itself.

**Tip:** use `type` to see whether a command is built-in or external. If it is external, you can always check the manual pages to learn more.

Example:

```bash
type whoami
# whoami is /usr/bin/whoami

type id
# id is /usr/bin/id

# View manual pages
man whoami
man id
```

For a full working example of special variables, command substitution and if statement, see the script:
[View the script here](../scripts/02-special-variables-demo.sh)

---

### Command Substitution

Use `$(...)` to capture command output.

```bash
DATE=$(date +%Y-%m-%d)
echo "Today is $DATE"
```

**Command Substitution Syntax:**

- Old syntax (backticks):

```bash
echo "Your username is: `id -un`"
```

- Newer syntax (preferred, POSIX-compliant):

```bash
echo "Your username is: $(id -un)"
```

**Tip:** Always use $(...) for readability and safer nesting of commands.
---

### if Statement

- Old syntax:

```bash
if [ -f "/etc/passwd" ]; then
  echo "File exists"
else
  echo "File missing"
fi
```

- New syntax:

```bash
if [[ -f "/etc/passwd" ]]; then
  echo "File exists"
else
  echo "File missing"
fi
```

---

### Conditional

Test expressions with `-f`, `-d`, `-z`, `-n`, `==`, etc.

```bash
if [ -z "$USERNAME" ]; then
  echo "No username provided"
fi
```

Other conditionals:

- `-b FILE`: FILE exists and is block special
- `-c FILE`: FILE exists and is character special
- `-d FILE`: FILE exists and is a directory
- `-e FILE`: FILE exists
- `-f FILE`: FILE exists and is a regular file

For more conditional, execute:

```bash
man test
```

**Tip:** Special variables like $PWD and $HOME are extremely useful in scripts to make paths dynamic and avoid hardcoding.

---

### Exit Statuses and Return Codes

Exit Statuses and Return Codes:

- `0` = success
- Non-zero = error

```bash
mkdir /tmp/demo && echo "Created" || echo "Failed"
```

---

### String Test Conditional

Compare strings:

```bash
if [[ "$USER1" = "$USER2" ]]; then
  echo "Users match"
fi
```

---

### More Special Variable

- `$$` = PID of script
- `$!` = PID of last background process
- `$@` = all arguments
- `$*` = all arguments as single string
- `$HOME` = Home directory of the current user
- `$PWD`: Current working directory
- `$RANDOM`: Generates a random integer each time it is accessed

---

### Reading Standard Input

```bash
# Read the username
read -p "Enter username: " USERNAME
echo "You entered: $USERNAME"
# Read the password
read -p "Enter your password: " PASSWORD
```

[View the script here](../scripts/02-special-variables-demo.sh)

---

### Creating Accounts

```bash
sudo useradd -m "$USERNAME"
sudo passwd "$USERNAME"
```

---

### Username conventions

- Lowercase only
- No spaces
- Prefer short, meaningful names
- Avoid special characters

---

### More Quoting

- "double quotes" allow variable expansion
- 'single quotes' prevent expansion
- \ for escaping characters

```bash
echo "Hello $USERNAME"
echo 'Hello $USERNAME'
```
