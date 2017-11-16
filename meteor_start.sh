#!/bin/bash
#==========================
#
#       STAR COMMANDER ONLINE
#
#==========================

# VERSION 5
# 2017/06/11


#MANUAL SETUP

#METHOND 1
#NODEJS
#cd ~
#curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
#sudo bash nodesource_setup.sh
#sudo apt-get install nodejs
#sudo apt-get install build-essential

#METHOD 2
#sudo apt-get install nodejs
#sudo apt-get install nodejs-legacy
#sudo apt-get install npm

#sudo iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 3000
#sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3000
#sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000

#MONGODB
#https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/


#FOREVER
#npm install forever
#npm install forever-monitor
#npm i forever -g 

forever stopall

#FORWARD PORT 80 TO 3000
sudo iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 3000
sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000


export METEOR_CORDOVA_COMPAT_VERSION_IOS="v40"
export METEOR_CORDOVA_COMPAT_VERSION_ANDROID="v40"
export METEOR_CORDOVA_COMPAT_VERSION_EXCLUDE=*
export ROOT_URL='https://www.mywebsite.com'
export MONGO_URL='mongodb://mongouser:mongopassword@localhost:27017/projectdb'
export MONGO_OPLOG_URL='mongodb://oploguser:oplogpassword@localhost:27017/local?authSource=projectdb'
export PORT='3000'
export METEOR_SETTINGS=$(cat /home/meteoruser/settings.json )
export KADIRA_PROFILE_LOCALLY=1
#export KADIRA_APP_ID=your_nodechef.com_app_id
#export KADIRA_APP_SECRET=your_nodechef.com_secret

cd /home/meteoruser/upload
rm -rf bundle
tar -xvf starcommanderonline.tar.gz

rm -rf /home/meteoruser/production
mkdir /home/meteoruser/production

cd /home/meteoruser/upload/bundle
mv * /home/meteoruser/production

cd /home/meteoruser/production/programs/server
npm install --production
npm install stripe
npm install paypal-rest-sdk
#npm install sendgrid

cd /home/meteoruser/production/
#node main.js
forever start main.js
