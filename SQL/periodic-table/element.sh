#!/bin/bash

sanitize() {
  CLEAN="${1//_/}"
  CLEAN=${CLEAN// /_}
  echo ${CLEAN//[^a-zA-Z0-9_]/}
}

# bail out if no arguments
if [[ -z $1 ]]
then
  echo Please provide an element as an argument. 
  exit 1
fi

# figure out argument type
if [[ $1 =~ ^[0-9]+$ ]]
then
  needleColumn='atomic_number'
elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
then
  needleColumn='symbol'
else 
  needleColumn='name'
fi

# query DB
db="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
needle=$(sanitize $1)
queryResult=$($db "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type 
FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE $needleColumn = '$(sanitize $1)'")

if [[ -z $queryResult ]]
then
  echo "I could not find that element in the database."
  exit 1
fi

echo $queryResult | while read atomicNumber divider elementSymbol divider elementName divider atomicMass divider meltingPoint divider boilingPoint divider elementType
  do
    echo "The element with atomic number $atomicNumber is $elementName ($elementSymbol). It's a $elementType, with a mass of $atomicMass amu. $elementName has a melting point of $meltingPoint celsius and a boiling point of $boilingPoint celsius."
  done
