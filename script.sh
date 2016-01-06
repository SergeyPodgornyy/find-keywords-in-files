#!/bin/bash

i=0
while read line
do
	array[ $i ]="$line"
	(( i++ ))
done < <(ls)

KEYWORDS=( NoSQL C++ "base de donnees" Anglais Rigueur ITIL Django jQuery Python PHP HTML CodeIgniter ERP C# XML Ajax JavaScript UML SQL C Doxygen "Pack Office" VBA SharePoint MySQL MVC iOS Android WinRT )

n=0
while [ $n -le $i ] 
do
	# echo ${array[n]}
	(( n++ ))
done
