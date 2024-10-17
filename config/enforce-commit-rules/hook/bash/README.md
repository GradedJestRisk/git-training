This hook check the branch name.

To probe this hook in this repository, install it by running
> chmod +x pre-commit
> git config core.hooksPath '<FULL_PATH_TO_THIS_VERY_DIRECTORY_HOOK>'

Then, give it a try

Happy path: commit shoudl be accepted
> git checkout -b feature_add-a-perpetual-token
> git commit --allow-empty -m "Commit on valid branch name"
> git log

Exception path
> git checkout -b feature-add-a-perpetual-token
> git commit --allow-empty -m "Commit on invalid branch name"
> git log
