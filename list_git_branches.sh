# This script iterates through all subdirectories of the current directory,
# checking for Git repositories and displaying the current branch for each
# found repository.

for d in */ ; do
    cd "$d"
    if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
        echo "$d \t - $(git branch --show-current)"
    else
        echo "$d \t - Not a Git repository"
    fi
    cd ..
done
