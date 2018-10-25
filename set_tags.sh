#!/usr/bin/env bash
BRANCH="master"

echo -e ${TRAVIS_BRANCH}
# Are we on the right branch?
if [ "$TRAVIS_BRANCH" = "$BRANCH" ]; then

  # Is this not a Pull Request?
  if [ "$TRAVIS_PULL_REQUEST" = false ]; then

    # Is this not a build which was triggered by setting a new tag?
    if [ -z "$TRAVIS_TAG" ]; then
      echo -e "Starting to tag commit.\n"

      git config --global user.email "yhossam@inmobly.com"
      git config --global user.name "YHossam"
      echo -e "Logging"
	  echo ${GH_TOKEN}
	  pwd
	  ls app/build/outputs/apk/debug/
      echo -e "Logging"
     # git remote remove origin
     # git remote add origin  https://${GH_TOKEN}@github.com/YHossam/TestCI.git > /dev/null 2>&1
     # Add tag and push to master.
      git tag -a v${TRAVIS_BUILD_NUMBER} -m "Travis build $TRAVIS_BUILD_NUMBER pushed a tag."
      git push --quiet origin --tags
      git fetch origin

      echo -e "Done magic with tags.\n"
  fi
  fi
fi
