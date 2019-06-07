#!/usr/bin/env bash

if [ "${TRAVIS_PULL_REQUEST}" != "false" ]; then
    echo "Not deploying pull request."
    exit
fi

echo -e "\nRunning Travis Deployment"
echo "Setting up Git Access"
openssl aes-256-cbc -K $encrypted_171119b0d9a3_key -iv $encrypted_171119b0d9a3_iv -in deploy_key.enc -out deploy_key -d
chmod 600 deploy_key

# Add the SSH key so it's used on git commands
eval `ssh-agent -s`
ssh-add deploy_key

HTTPS_URL=$(git config remote.origin.url)
SSH_URL=${HTTPS_URL/https:\/\/github.com\//git@github.com:}
git remote set-url origin "${SSH_URL}"

git config --global user.name ${GH_COMMIT_AUTHOR}
git config --global user.email ${GH_COMMIT_EMAIL}

bundle exec rake deploy
