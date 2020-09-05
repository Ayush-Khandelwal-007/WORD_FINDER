#!/bin/sh

check(){
echo "                                      GETTING INTO DIRECTORY ---------$1-------------\n\n\n\n"

for entry in `ls $1`; do                                                          #This loop help to iterate over the list of all sub-directories and files in the present directory.


    if [ -d "$1/$entry" ]; then                                                   #Condition to check if the given entry in list is directory or not by comparing its permissions.
        check "$1/$entry" $2                                                      #Recursively calling the same function for the sub directory so all the files in sub-directory could also be iterated.


    elif [ -f "$1/$entry" ]; then                                                 #Condition to check if the given entry in list is a file or not by comparing its permissions.
            if grep -q "\<$2\>"  "$1/$entry"; then                                #Condition to check if the given word is in the file or not.
                echo "$1/$entry have word $2 below no of times:";
                tr '[:space:]' '[\n*]'  < "$1/$entry" | grep -c -i "\<$2\>"       #Grep with -c or --count prints the number of time a string occured in the searched file.
                echo "\n"
            fi
        

    else
        echo "$entry is not valid";                                               #If the entry is neither a file nor a sub-directory ,then some error occured.
        exit 1                                                                    #As an error occured the program terminates here and exit with exit code 1 which is to be 0 when the program runs successfully.
    fi

    
done
echo "                                      GETTING OUT OF DIRECTORY ---------$1-------------\n\n"
}

echo "\n\n**************************************************************\n\n\n\n"
echo "Enter Absolute path\n";
read path                                                                         #For taking input the directory path.


echo "\n\n**************************************************************\n\n"
echo "Enter the word to be searched\n"
read wordreq                                                                      #For taking input the word to be searched.



echo "\n\n**************************************************************\n\n"
check $path $wordreq;                                                             #Passing on the path and the word to be searched to the serching function.
echo "\n\n**************************************************************\n\n"
