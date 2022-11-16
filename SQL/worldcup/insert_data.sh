#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


# clear up tables
echo -e "Clearing up tables..."
echo "$($PSQL "TRUNCATE TABLE games, teams")"

exec < ./games.csv
read header
while IFS="," read -r year round winner opponent winner_goals opponent_goals
do
  # populate teams
  echo "$($PSQL "INSERT INTO teams (name) VALUES ('$winner') ON CONFLICT DO NOTHING")"
  echo "$($PSQL "INSERT INTO teams (name) VALUES ('$opponent') ON CONFLICT DO NOTHING")"

  # populate games
  winner_id="$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")"
  opponent_id="$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")"

  echo "$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals)")"

done 