# This script can be used to rename/move files in a git repository
# This will also change all references to this files accordingly

echo renaming $1 to $2
git mv $1 $2
grep -rl $1 | xargs sed -i "s/$1/$2/g"
