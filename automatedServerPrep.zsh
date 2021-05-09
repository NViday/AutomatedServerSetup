#NVIDAYTECH 2021
#Automated Server Setup
#--------------
#Please read the README
#-------------


#!/bin/zsh

serverName=${1}

#fullpath of the server folder you want to create
serverFolder=${2}

#please update this or just enter it as an input
# full path of the automatedServerSetup folder
automatedServerSetupFolder=${3}

serverFiles=${automatedServerSetupFolder}/serverFiles/

#Refer to step 1 in the tutorial
#Create workspace & server  
echo "creating folder ..."

#Create server Folder 
mkdir -p ${serverFolder} 

#move in the server Folder
cd ${serverFolder}

echo "running npm in a second, please answer the prompt that would appear."

npm init

#create README.md and .gitignore 

echo "#${serverName}">README.md

cp ${serverFiles}/gitignore.txt .gitignore

#init git 

git init 


#Refer to step 2 in the tutorial
# install express

yarn add express 

express -f 

#remove jade 
yarn remove jade


 
#Refer to step 3,4&5 in the tutorial 
#dev & test dependencies 

# install babel scripts, nodemon, eslint, prettier

yarn add @babel/cli @babel/core @babel/plugin-transform-runtime @babel/preset-env @babel/register @babel/runtime @babel/node --dev

yarn add nodemon --dev 

yarn add eslint eslint-config-airbnb-base eslint-plugin-import prettier --dev

yarn add dotenv

#installing sinon because of some dependencies complains 
#please remove if you don't want it
yarn add mocha chai nyc sinon sinon-chai supertest coveralls --dev


#fix workspace
rm -f index.js app.js
 
rm -Rf "routes/" "views/" "public/" "bin/"

mkdir -p "src/" "src/bin" "src/routes"

mkdir -p test

cp ${serverFiles}/src-app.js src/app.js

cp ${serverFiles}/src-bin-www.js src/bin/www.js

cp ${serverFiles}/src-routes-index.js src/routes/index.js

cp ${serverFiles}/test-setup.js test/setup.js

cp ${serverFiles}/test-index.test.js test/index.test.js

cp ${serverFiles}/src-config.js src/config.js

cp ${serverFiles}/env.txt .env

cp ${serverFiles}/babelrc.txt .babelrc

cp ${serverFiles}/prettierrc.txt .prettierrc

cp ${serverFiles}/travisyml.txt .travis.yml

cp ${serverFiles}/eslintrcjson.txt .eslintrc.json

cp ${serverFiles}/nodemon.json nodemon.json 

cp ${serverFiles}/package.json package.json

echo "server setup completed, commit changes" 

git add * 

git commit 
