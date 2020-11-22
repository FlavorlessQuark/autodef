# Autodef
Automatic include guard for .h files

# Usage

Just run the autodef.sh, it will add an include guard to all your .h files (in current and subdir) if they don't already have one

    ./autodef.sh

**Note**

Permissions might be messed up, in which case do `chmod 777 autodef.sh`

# Future stuff

Considering making an alias to touch that would automatically add an include guard on any .h file that get touched

Might also add the option to pass files are arguments and only include guard those files (with the current behavior becoming the default if no argument is passed)
