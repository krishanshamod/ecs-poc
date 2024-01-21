#!/bin/bash

VERSION=""

# get parameters
while getopts v: flag
do
  case "${flag}" in
    v) VERSION=${OPTARG};;
  esac
done

# get current hash and see if it already has a tag
GIT_COMMIT=`git rev-parse HEAD`
NEEDS_TAG=`git describe --contains $GIT_COMMIT 2>/dev/null`

# exit if tag already exists
if [ -n "$NEEDS_TAG" ]; then
  echo "Already a tag on this commit"
  exit 0
fi

# get the latest tag in the current branch
CURRENT_VERSION=`git describe --abbrev=0 --tags 2>/dev/null`

# if there are no tags, start tags at v1.0.0 and exit
if [[ $CURRENT_VERSION == '' ]]
then
  echo "No version tag found, creating v1.0.0"
  git tag v1.0.0
  git push --tags
  exit 0
fi

echo "Current Version: $CURRENT_VERSION"

# remove the 'v' prefix
CURRENT_VERSION=${CURRENT_VERSION#v}

# get major minor and patch
CURRENT_VERSION_PARTS=(${CURRENT_VERSION//./ })
VNUM1=${CURRENT_VERSION_PARTS[0]}
VNUM2=${CURRENT_VERSION_PARTS[1]}
VNUM3=${CURRENT_VERSION_PARTS[2]}

# increment version number based on parameter
if [[ $VERSION == 'major' ]]
then
  VNUM1=$((VNUM1+1))
elif [[ $VERSION == 'minor' ]]
then
  VNUM2=$((VNUM2+1))
elif [[ $VERSION == 'patch' ]]
then
  VNUM3=$((VNUM3+1))
else
  echo "No version type or incorrect type specified, try: -v [major, minor, patch]"
  exit 1
fi

# create and push new tag
NEW_TAG="v$VNUM1.$VNUM2.$VNUM3"
echo "New Version: $NEW_TAG"
git tag $NEW_TAG
git push --tags

exit 0