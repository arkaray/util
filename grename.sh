# This script can be used to rename/move files in a git repository
# This will also change all references to this files accordingly

usage='./grename.sh <old name/path> <new name/path>'
[ -z $1 ] && (echo $usage; exit 0)
[ -z $2 ] && (echo $usage; exit 0)

[ -f $1 ] || (echo 'source file does not exist' >&2; exit 1)
[ -f $2 ] && (echo "$2 already exists" >&2; exit 1)

echo renaming $1 to $2
git mv $1 $2
s1=$(echo $1 | sed -i 's/\//\\\//g')
s2=$(echo $2 | sed -i 's/\//\\\//g')
grep -rl $1 | xargs sed -i "s/$s1/$s2/g"
