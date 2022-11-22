#!/bin/bash

generateNumber() {
  echo $((1 + $RANDOM % 1000))
}

echo Enter your username:
read userName

db="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

lookUpUserResult=$($db "SELECT user_id, name, COUNT(games.game_id), MIN(games.attempts) FROM users LEFT JOIN games USING (user_id) WHERE name = '$userName' GROUP BY users.user_id;")

if [[ ! -z $lookUpUserResult ]]
then
  IFS="|" read userId userName gameCount bestGame <<< $lookUpUserResult 
  echo -e "\nWelcome back, $userName! You have played $gameCount games, and your best game took $(( bestGame ? bestGame : 0 )) guesses."    
else
  echo -e "\nWelcome, $userName! It looks like this is your first time here."

  # add user record
  $db "INSERT INTO users (name) VALUES ('$userName');" > /dev/null
fi

userId=$($db "SELECT user_id FROM users WHERE name = '$userName';")

numberToGuess=$(generateNumber)
hasWon=False
attempts=0

echo -e "Guess the secret number between 1 and 1000:"

while [ $hasWon != True ]
do 
  read userGuess
  # check for integer
  if [[ ! $userGuess =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
  else
    ((attempts++))

    # check if guessed
    if [[ $userGuess -eq $numberToGuess ]]
    then
      hasWon=True
    elif [[ $userGuess -gt $numberToGuess ]]
    then
      echo -e "\nIt's lower than that, guess again:"
    else
      echo -e "\nIt's higher than that, guess again:"
    fi
    
  fi
done

$db "INSERT INTO games (user_id, attempts) VALUES ($userId, $attempts);" > /dev/null
echo "You guessed it in $attempts tries. The secret number was $numberToGuess. Nice job!"
