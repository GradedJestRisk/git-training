set -e

# Setup

rm -rf ./git-sandbox

git clone git@github.com:GradedJestRisk/git-sandbox.git

cd git-sandbox
git config user.name "GradedJestRisk"
git config user.email "graded.jest.risk@gmail.com"


# Master
git checkout master
touch file.txt
echo 'D' >> file.txt
git add .
git commit -m "Add D to file"
git tag D

echo 'E' >> file.txt
git add .
git commit -m "Add E to file"
git tag E

# Topic branch from master

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

# Master keep on going

git checkout master

echo 'F' >> file.txt
git add .
git commit -m "Add F to file"
git tag F

echo 'G' >> file.txt
git add .
git commit -m "Add G to file"
git tag G


# Now display all

GIT_PAGER=cat git log --graph master topic


echo "######################################################################"
echo "Base example for git-rebase has been set (see git help rebase)"
echo "You can checkout master, topic or any comit by using its tag (A,B, ... G))"
echo "######################################################################"
echo ""
echo "                     A---B---C topic "
echo "                    /                "
echo "               D---E---F---G master  "
echo ""
