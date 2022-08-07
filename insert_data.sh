#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams,games")

# Insert Teams
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT HOME_SCORE AWAY_SCORE
do
  if [[ $WINNER != 'winner' ]]
  then
  # get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # If team does not exist
    if [[ -z $TEAM_ID ]]
    then
      TEAM_ID_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $TEAM_ID_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi

      # get new team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
  fi

  if [[ $OPPONENT != 'opponent' ]]
  then
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    if [[ -z $OPPONENT_ID ]]
    then
      OPPONENT_ID_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $OPPONENT_ID_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi

      # get new team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
  fi
done



# Insert Games
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT HOME_SCORE AWAY_SCORE
do
  if [[ $YEAR != 'year' ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    if [[ -z $WINNER_ID || -z $OPPONENT_ID ]]
    then
      echo Winning team or opponent team does not exist
    else
      GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID AND winner_goals=$HOME_SCORE AND opponent_goals=$AWAY_SCORE")

      if [[ -z $GAME_ID ]]
      then
        GAME_INSERT_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$HOME_SCORE,$AWAY_SCORE)")
        if [[ $GAME_INSERT_RESULT == "INSERT 0 1" ]]
        then
          echo Inserted into games, $ROUND, $WINNER VS $OPPONENT
        fi

        # get new game_id
        GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID AND winner_goals=$HOME_SCORE AND opponent_goals=$AWAY_SCORE")
      fi
    fi
    
  fi
done
