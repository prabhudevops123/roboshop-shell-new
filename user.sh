echo -e "\e[33mConfiguring NodeJS\e[0m"

dnf module disable nodejs -y &>>/tmp/roboshop.log
dnf module enable nodejs:20 -y &>>/tmp/roboshop.log

echo -e "\e[33mInstall NodeJS\e[0m"
dnf install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33mAdd App user\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33mCreate App directory\e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33mDownload App content\e[0m"
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip  &>>/tmp/roboshop.log

cd /app

echo -e "\e[33mExtract App Content\e[0m"
unzip /tmp/user.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33mInstall NodeJS dependencies\e[0m"
npm install

echo -e "\e[33mSetup systemd service\e[0m"
cp /home/centos/roboshop-shell-new/user.service /etc/systemd/system/user.service &>>/tmp/roboshop.log


echo -e "\e[33mStart user service\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable user &>>/tmp/roboshop.log
systemctl start user  &>>/tmp/roboshop.log


#echo -e "\e[33mCopy mongoDB repo file\e[0m"
#cp /home/centos/roboshop-shell-new/mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log
#
#echo -e "\e[33mInstalli mongoDB client\e[0m"
#dnf install mongodb-mongosh -y &>>/tmp/roboshop.log
#
#echo -e "\e[33mLoad Schema\e[0m"
#mongosh --host mongodb-dev.prabhanjandevops.store </app/db/master-data.js &>>/tmp/roboshop.log