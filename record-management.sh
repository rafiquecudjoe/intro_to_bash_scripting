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
     rm Personal_Records_System/credentials/$credential_name/"$credential".txt
     
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
           4) add_personal_note
		   ;;
           5) add_personal_note
                   ;;
           6) add_personal_note
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

