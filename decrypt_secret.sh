#!/bin/sh

# Decrypt the file
mkdir ${HOME}/f5-xc-cert
# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase="${GH_F5XC_API_P12_FILE_PASSPHRASE}" \
--output "${HOME}/f5-xc-cert/${F5XC_API_P12_FILE} ${F5XC_API_P12_FILE}.gpg"