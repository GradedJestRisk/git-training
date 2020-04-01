#!/bin/sh
set -e

BASE_DIRECTORY=~

# Setup
cd $BASE_DIRECTORY
rm -rf sandbox-local

# Create repo
git init sandbox-local
cd sandbox-local
git config user.name "local"
git config user.email "local@example.net"

git checkout -b master

touch timeline.txt
git add timeline.txt
git commit -am "Create world"

echo 'And there was evening, and there was morning—the first day.' >> timeline.txt
git commit -am "First day passed"
git tag FIRST-DAY

echo 'And there was evening, and there was morning—the second day.' >> timeline.txt
git commit -am "Second day passed"
git tag SECOND-DAY

echo 'And so on, sure you get the idea ?' >> timeline.txt
git commit -am "Time lapse"
git tag TIME-LAPSE

echo 'And there was evening, and there was morning—the 737 516 day.' >> timeline.txt
git commit -am "Slowing down to 30 of march 2020"
git tag 30-MARCH-2020

echo 'And there was evening, and there was morning—the 737 517 day.' >> timeline.txt
git commit -am "Time goes by as usual, now at 31 of march 2020"
git tag 31-MARCH-2020

GIT_PAGER=cat git shortlog

echo "Feeling ..king of strange..?"
read reply
# don't care the reply

echo "Let's rewrite history.."
git reset --hard 31-MARCH-2020

echo "And now.."
echo 'Happy birthday https://github.com/nennigb !!' >> timeline.txt
git commit -a --amend --no-edit

cat timeline.txt 
echo -n "Feel better, isn't it ?"
echo '_few commits later, a markdown voice say..._' >> timeline.txt
echo '**No kidding! **' >> timeline.txt

