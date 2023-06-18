#!/bin/bash

display_menu(){
    echo "1. Add a new credential"
    echo "2. Remove credential"
    echo "3. Add personal notes"
    echo "4. Remove personal notes"
    echo "5. Add an important date"
    echo "6. Remove important date"
    echo "7. Search for a credential or note"
    echo "8. Add a backup for records"
    echo "9. Generate a report"
    echo "10. Exit"
}

add_credential(){
     read -p "Enter credential name Eg.Facebook :" credential_name
     read -p "Enter username :" username
     read -p "Enter password :" password
     read -p "Enter email_address :" email_address
    
     # create directory
     mkdir -p Personal_Records_System
     cd Personal_Records_System
     mkdir -p credentials
     cd credentials
     mkdir $credential_name
     cd $credential_name
    
     # write credential to file
     echo "$username" > username.txt
     echo "$password"> password.txt
     echo "$email_address" > email.txt

     # secure credential so that no user can access
     chmod 600 username.txt password.txt email.txt
     echo "Credentials added successfully"
}

remove_credential(){
     read -p "Enter the credential name you want credential from Eg.Facebook :" credential_name
     read -p "Enter the specific credential you want to remove :" credential

     # remove credential
     rm Personal_Records_System/credentials/$credential_name/$credential.txt
     
}

add_personal_note(){
     read -p "Enter name of personal note :" note_name
     read -p "Enter personal note :" note

     # create directory if not created
     location="Personal_Records_System/notes"
     mkdir -p $location

     # write credential to file
     echo "$note" > $location/$note_name.txt

     # secure credential so that no user can access
     chmod 600 $location/$name_of_date_to_add.txt
     echo "Personal note added successfully"
}

remove_personal_note(){
     read -p "Enter name of personal note to remove :" important

     # remove credential
    rm Personal_Records_System/notes/testing.txt

}

add_important_date(){
     read -p "Enter name of important date :" name_of_date_to_add
     read -p "Enter important date :" date

     # create directory if not created
     location="Personal_Records_System/notes"
     mkdir -p $location

     # write important date to file
     echo "$date" > $location/$name_of_date_to_add.txt

     # secure credential so that no user can access
     chmod 600 $location/$name_of_date_to_add.txt
     echo "Important date  added successfully"
}

remove_important_date(){
     read -p "Enter name of important date to remove :" date_to_remove

     # remove credential
     rm Personal_Records_System/notes/$date_to_remove.txt

     echo "Important date added successfully"

}


handle_user_input(){
   read -p "Enter your choice: " choice
   case $choice in
	   1) add_credential
		   ;;
	   2) remove_credential
		   ;;
	   3) add_personal_note
		   ;;
           4) remove_personal_note
		   ;;
           5) add_important_date
                   ;;
           6) remove_important_date
                   ;;
	   7) remove_personal_note
		   ;;
	   8) search_for_record
		   ;;
	   9) add_backup
		   ;;
	   10) echo "Existing..."
               exit 0
                   ;;
   esac
	   }

# Main

while true;do 
	display_menu
	handle_user_input
done

