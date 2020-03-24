#!/bin/sh
set -e

BASE_DIR=~
cd $BASE_DIR
# Setup

rm -rf ./git-sandbox-local
rm -rf ./git-sandbox-remote

mkdir git-sandbox-local
mkdir git-sandbox-remote

# Create remote repo
cd git-sandbox-remote
git init
git config user.name "remote"
git config user.email "remote@example.net"

git checkout -b master

touch file.txt
git add file.txt
git commit -m "Create file"

touch file.txt
echo 'D' >> file.txt
git add .
git commit -m "Add D to file"
git tag D

echo 'E' >> file.txt
git add .
git commit -m "Add E to file"
git tag E

cd ..

# Create local repo

git clone $BASE_DIR/git-sandbox-remote git-sandbox-local

cd git-sandbox-local
git config user.name "local"
git config user.email "local@example.net"

git checkout master

# Create topic branch, stemming from master

git checkout -b topic

echo 'A' >> file.txt
git add .
git commit -m "Add A to file"
git tag A

echo 'B' >> file.txt
git add .
git commit -m "Add B to file"
git tag B

echo 'C' >> file.txt
git add .
git commit -m "Add C to file"
git tag C

# Master branch is moving forward on master

cd ../git-sandbox-remote
git checkout master

echo 'F' >> file.txt
git add .
git commit -m "Add F to file"
git tag F

echo 'G' >> file.txt
git add .
git commit -m "Add G to file"
git tag G

cd ..

# Local branch is ready to be rebased

cd git-sandbox-local

GIT_PAGER=cat git log --graph master origin/master topic

echo ""
echo "######################################################################"
echo "Base example for git-rebase ready (see git help rebase)"
echo "You can checkout master, topic or any comit by using its tag (A,B, ... G))"
echo "######################################################################"
echo ""
echo "                           HEAD               "
echo "                           ↓                  "
echo "                     A-----B-----C  topic     "
echo "                    /                         "
echo "             D-----E-----F------G   master    "
echo "                   ↑            ↑             "
echo "                   master        master (unfetched)"
echo ""
echo "######################################################################"i
echo ""
