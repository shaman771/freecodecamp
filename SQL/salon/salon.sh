#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo "Welcome to The Salon!"
echo -e "\nPlease select your desired service:\n"

availableServices=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

mainMenu () {
  if [[ ! -z $1 ]]
  then
    echo -e "\n$1\n"
  fi

  echo "$availableServices" | while read serviceId divider serviceName
  do
    echo "$serviceId) $serviceName"
  done

  handleUserInput
}

handleUserInput () {
  read serviceId

  if [[ ! $serviceId =~ ^[0-9]+$ ]]
  then
    mainMenu "Please enter a valid service number."
  fi

  serviceName=$($PSQL "SELECT name FROM services WHERE service_id = $serviceId")

  if [[ -z $serviceName ]]
  then
    mainMenu "Please enter a valid service number."
  fi

  echo -e "\nWhat's your phone number?"
  read customerPhone

  customerName=$($PSQL "SELECT name FROM customers WHERE phone = '$customerPhone'")

  if [[ -z $customerName ]]
  then
    echo -e "\nWhat's your name?"
    read customerName
    $PSQL "INSERT INTO customers(name, phone) VALUES('$customerName', '$customerPhone')" > /dev/null
  fi

  customerId=$($PSQL "SELECT customer_id FROM customers WHERE phone='$customerPhone'")

  echo -e "\nWhat time would you prefer for your visit?"
  read serviceTime

  if [[ -z $serviceTime ]]
  then
    echo -e "\nPlease enter your desired service time:"
    while [ -z $serviceTime ]; do read serviceTime; done
  fi

  $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($customerId, $serviceId, '$serviceTime')" > /dev/null
  echo -e "\nI have put you down for a $(echo $serviceName | sed -E 's/^ +//') at $serviceTime, $customerName."
}


mainMenu