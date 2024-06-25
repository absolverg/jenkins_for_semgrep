#!/bin/bash

curl -L https://github.com/microsoft/team-explorer-everywhere/releases/download/14.139.0/TEE-CLC-14.139.0.zip -o TEE-CLC-14.139.0.zip
unzip TEE-CLC-14.139.0.zip
cp -r TEE-CLC-14.139.0 /usr/local/bin