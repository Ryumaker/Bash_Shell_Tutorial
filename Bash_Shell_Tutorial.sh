echo "[Original Source Code]"
sed -n -e '1,$p' $1
read -p "Enter Your UserName: " username
echo "----------------------------------------------------
Hello, $username!
[Shell Program Options]
0. Menu
1. Enable/disable empty line removal
2. Enable/disable comment removal
3. Enable/disable duplicate whitespaces among words
4. Add the line number
5. Change the variable name
6. Remove \${} in arithmetic expansion
7. Export new file
8. Exit
----------------------------------------------------"
while : 
do
	read -p "(Enter 0 to View The Menu) Enter Your Choice [ 0 - 8 ]: " number
	if [ $number -eq  8 ]; then
		echo "Bye!"
		if [ -e ./temp.sh ]; then
			rm ./temp.sh

		elif [ -e ./temp.txt ]; then
			rm ./temp.txt

		else
			break
		fi
		break
	else
		case $number in
			0 ) echo "The Menu For This Program Is As Follows
				---------------------------------------------------
				Hello, $username!
				[Shell Program Options]
				0. Menu
				1. Enable/disable empty line removal
				2. Enable/disable comment removal
				3. Enable/disable duplicate whitespaces among words
				4. Add the line number
				5. Change the variable name
				6. Remove \${} in arithmetic expansion
				7. Export new file
				8. Exit
				----------------------------------------------------";;
			
			1 ) read -p "Do you want to remove all blank line? (y/n) : " ans
				case $ans in
					[Yy]* ) sed '/^$/d' $1 | cat -n
						sed '/^$/d' $1 > temp.sh
						flag=1;;
					[Nn]* ) echo "Nothing to do.";;
					* ) echo "Please Enter Y or N";;
				esac;;

			2 ) read -p "Do you want to remove all comment line? (y/n) : " ans
                                case $ans in
					[Yy]* ) sed '/^# /d' $1 | cat -n
						sed '/^# /d' $1 > temp.sh
						flag=1;;
                                        [Nn]* ) echo "Nothing to do.";;
                                        * ) echo "Please Enter Y or N";;
                                esac;;

			3 ) read -p "Do you want to remove duplicate whitespaces? (y/n) : " ans
                                case $ans in
					[Yy]* ) sed -E 's/ [ \t]*/ /g' $1 | cat -n
						sed -E 's/ [ \t]*/ /g' $1 > temp.sh
						flag=1;;
                                        [Nn]* ) echo "Nothing to do.";;
                                        * ) echo "Please Enter Y or N";;
                                esac;;

			4 ) read -p "Where you want to add whether the start or the end of the line? (s/e) : " ans
                                case $ans in
                                        [Ss]* ) cat $1 | awk '{print "# " NR " " $0 }'
						cat $1 | awk '{print "# " NR " " $0 }' > temp.txt
						flag=2;;
					[Ee]* ) cat $1 | awk '{print $0 " # " NR}'
						cat $1 | awk '{print $0 " # " NR}' > temp.txt
						flag=2;;
                                        * ) echo "Please Enter S or E";;
                                esac;;

			5 ) read -p "Enter Variablename to be changed : " word
			    read -p "Enter New variable name : " change  
			    cat $1 | sed -E "s/$word/$change/g"
			    sed -E "s/$word/$change/g" $1 > temp.sh
			    flag=1;;

			6 ) read -p "Do you want to remove \${}? (y/n) : " ans
                                case $ans in
					[Yy]* ) sed -E 's/\$\{(\w+)\}/\1/g' $1 | cat -n
						sed -E 's/\$\{(\w+)\}/\1/g' $1 > temp.sh
						flag=1;;
                                        [Nn]* ) echo "Nothing to do.";;
                                        * ) echo "Please Enter Y or N";;
                                esac;;
			7 ) if [ $flag -eq 1 ]; then
				mv temp.sh result.sh
				echo "Successfully Saved as a file named 'result.sh'"
			    elif [ $flag -eq 2 ]; then
				mv temp.txt result.txt
				echo "Successfully Saved as a file named 'result.txt'"
			    fi
		 esac
	fi
done

			

