# This script can be used to rename/move files in a git repository
# This will also change all references to this files accordingly

[ -f $1 ] || echo 'source file does not exist'
[ -f $2 ] && echo "$2 already exists"
echo renaming $1 to $2
git mv $1 $2
s1=$(echo $1 | sed -i 's/\//\\\//g')
s2=$(echo $2 | sed -i 's/\//\\\//g')
grep -rl $1 | xargs sed -i "s/$s1/$s2/g"
