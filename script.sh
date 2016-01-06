#!/bin/bash

# Store folder content into array
i=0
while read line
do
	array[ $i ]="$line"
	(( i++ ))
done < <(ls fich/)

# Define keywords which we will use for search
KEYWORDS=( NoSQL C++ Anglais Rigueur ITIL Django jQuery Python PHP HTML CodeIgniter ERP C# XML Ajax JavaScript UML SQL C Doxygen VBA SharePoint MySQL MVC iOS Android WinRT )

# The following were deleted for an array:
# - base de donnees
# - Pack Office

# Write header of file
str="Name of file"
for val in "${KEYWORDS[@]}"
do
	str=$str'|'$val
done
echo $str>result

# grep -o
# Print  only the matched (non-empty) parts of a matching line, with each such part on a separate output line.

# grep -w
# Select  only  those  lines containing matches that form whole words.

# grep -c
# Suppress  normal  output;  instead  print  a  count  of matching  lines  for  each  input  file.

# grep -i
# Ignore  case  distinctions  in both the PATTERN and the input files.

# Iterate through files in array
n=0
while [ $n -le $i ] 
do
	name=$(echo ${array[n]}) # Write name of file
	for word in "${KEYWORDS[@]}" # Iterate through keywords
	do
		ser=$(grep -woi "$word" fich/"${array[n]}" | grep -c $word) # Search count of keywordsin file
		count=$count'|'$ser # Concatenate string with number of matched words
	done
	echo $name$count>>result 2>/dev/null # Push result (standart output)  to a file. Standart error will send to /dev/null (to trash)
	unset count # unset 'count' variable for this iteration
	(( n++ ))
done
