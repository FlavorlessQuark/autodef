# Autodef
Automatic include guard for .h files

# Usage

Run autodef.h

    ./autodef.sh
    ./autodef.sh [files]

Without arguments, it will find all header files in the current directory and all subdirectory and add an include guard to each of them if they do not have one

With arguments, it will only add an include guard to the specified files and create them if they don't exist

( *Note: It will create the file even if it is not a .h file, so beware of misspelling | I may or may not fix it* )

**Note**

Permissions might be messed up, in which case do `chmod 777 autodef.sh`

This will not correct messed up include guards it will only create them if they do not exist

This converts all files to Unix format - Else they have a file ending that I don't want to deal with -

# Future stuff

Considering making an alias to touch that would automatically add an include guard on any .h file that get touched

