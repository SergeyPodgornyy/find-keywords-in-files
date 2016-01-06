#!/bin/bash

i=0
while read line
do
	array[ $i ]="$line"
	(( i++ ))
done < <(ls fich/)

KEYWORDS=( NoSQL C++ Anglais Rigueur ITIL Django jQuery Python PHP HTML CodeIgniter ERP C# XML Ajax JavaScript UML SQL C Doxygen VBA SharePoint MySQL MVC iOS Android WinRT )

# The following were deleted for an array:
# - base de donnees
# - Pack Office

str="Name of file"
for val in "${KEYWORDS[@]}"
do
	str=$str:$val
done
echo $str>result

# grep -H
# Print  the  file  name  for  each  match.   This is the default when there is more than one file to search.

# grep -o
# Print  only the matched (non-empty) parts of a matching line, with each such part on a separate output line.

# grep -w
# Select  only  those  lines containing matches that form whole words.  The test is that the  matching  substring must  either  be  at  the  beginning  of  the  line, or preceded   by   a   non-word   constituent   character. Similarly,  it must be either at the end of the line or followed by a non-word  constituent  character.   Word-constituent  characters  are  letters,  digits, and the underscore.

# grep -c
# Suppress  normal  output;  instead  print  a  count  of matching  lines  for  each  input  file.   With the -v, --invert-match option (see below),  count  non-matching lines.

# grep -i
# Ignore  case  distinctions  in both the PATTERN and the input files.


n=0
while [ $n -le $i ] 
do
	name=$(echo ${array[n]})
	for word in "${KEYWORDS[@]}" 
	do
		ser=$(grep -wo "$word" fich/"${array[n]}" | grep -c $word)
		count=$count:$ser
	done
	echo $name$count>>result 2>/dev/null
	unset count
	(( n++ ))
done




