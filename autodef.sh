#!/bin/sh

## If no args find all .h files in current and sub dir#

check_guard()
{
	read -r line < $1
	local guard="#ifndef "$2
	if [ "$line" = "$guard" ]
	then
		no_guard=0
	else
		no_guard=1
	fi
}

make_guard()
{
	size="$(wc -c <"$1")"
	if [ $size = 0 ]
	then
		echo "#ifndef $2\n# define $2\n\n#endif" > $1
	else
		sed -i "1i #ifndef $2\n# define $2\n" $1
		echo -n "\n\n#endif" >> $1
	fi
}

def_all()
{
	files=$1
	if [ $# = 0 ]
	then
		files=`find . -type f -name "*.h"`
	fi

	for each in $files
	do
		if ! [ -f "$each" ]
		then
			touch $each
		fi
		dos2unix $each
		local file_path=$(dirname $each)"/"
		local file_name=$(basename $each)
		local guard_name=`echo "$file_name" | tr '[a-z]' '[A-Z]' | tr . _`
		check_guard $each $guard_name
		if [ $no_guard = 1 ]
		then
			make_guard $each $guard_name
		fi
	done
}

def_all $*

