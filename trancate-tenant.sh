#!/bin/bash


# Text colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'

# ! **********************

echo "Please enter your password:"
read -s password


if [ "$password" = "a" ]; then

export MYSQL_PWD="password"

# Database credentials
user="root"
host="localhost"


databases=$(mysql -u $user  -e "SHOW DATABASES LIKE 'tenant_%';" | grep -Ev "(Database|information_schema|performance_schema)")

PS3="Select a database: "
select db in $databases; do
    if [[ -n $db ]]; then
        # db_name= $db
        break
    else
        echo "Invalid option. Please select again."
    fi
done

# Tables to truncate
tables=("sales" "product_sales" "returns" "debit_note_products" "debit_notes" "product_returns" "purchases" "product_purchases" "return_purchases" "purchase_product_return" "product_warehouse" "erp_transactions" "erp_vouchers" "payments" "expenses" "manufactures" "manufacture_products")

# Truncate tables
for table in "${tables[@]}"

do
    mysql -u$user  -h $host $db -e "SET FOREIGN_KEY_CHECKS=0; TRUNCATE TABLE $table; SET FOREIGN_KEY_CHECKS=1;"
    echo -e "${GREEN}Done=> $table${RESET}"
done

mysql -u$user  -h $host $db -e "UPDATE products SET qty = 0"

echo -e "${RED}Done${RESET}"
else
    echo -e "${RED}Incorrect password. Exiting the script.${RESET}"
fi

read -p "Press Enter to exit..."
