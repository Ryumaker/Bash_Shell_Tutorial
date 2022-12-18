# Bash_Shell_Tutorial
2022 INHA University OSS Project #1 - Bash Shell Practice Using sed and awk

### :star2: sed
sed(Stream Editor) is a program for decomposing or converting text in Unix.  
It is used for performing basic text transformations on an input stream (a file or input from a pipeline)  
and extracting part of a file using pattern matching or substituting in a convenient way.

### :star2: awk
awk is a script language developed in Unix,  
and its basic function is to process and output input data in text form by line and word.  
It was named 'awk' after the first letters of the three names that created the script language.

### :pencil2: Usage
```
file_editor.sh filename
```
Example : **_./file_editor.sh test1.sh_**

### :bookmark_tabs: Function Descriptions

:one: **_Enable/disable empty line removal_**  
Remove all blank line

:two: **_Enable/disable comment removal_**  
Remove only comment not shebang

:three: **_Enable/disable duplicate whitespaces among words_**  
Remove duplicate whitespaces

:four: **_Add the line number_**  
Add the line number at the start or end of the line

:five: **_Change the variable name_**  
Enter the variable to be changed and the new variable name

:six: **_Remove ${} in arithmetic expansion_**  
Remove ${} in arithmetic expansion

:seven: **_Export new file_**  
Save the results of the function that you just ran and export the new file

:eight: **_Exit_**  
Program Exit
