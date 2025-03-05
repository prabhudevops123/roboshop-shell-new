echo -e "\e[33mConfiguring NodeJS\e[0m"
#curl -sL https://rpm.nodesource.com/setup_1ts.x | bash &>>/tmp/roboshop.log
dnf module disable nodejs -y #&>>/tmp/roboshop.log
dnf module enable nodejs:20 -y #&>>/tmp/roboshop.log

echo -e "\e[33mInstall NodeJS\e[0m"
dnf install nodejs -y #&>>/tmp/roboshop.log

echo -e "\e[33mAdd App user\e[0m"
useradd roboshop #&>>/tmp/roboshop.log

echo -e "\e[33mCreate App directory\e[0m"
rm -rf /app #&>>/tmp/roboshop.log
mkdir /app #&>>/tmp/roboshop.log

echo -e "\e[33mDownload App content\e[0m"
#curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip #&>>/tmp/roboshop.log
curl -L -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component-v3.zip
cd /app

echo -e "\e[33mExtract App Content\e[0m"
#unzip /tmp/catalogue.zip #&>>/tmp/roboshop.log
unzip /tmp/$component.zip
cd /app

echo -e "\e[33mInstall NodeJS dependencies\e[0m"
npm install npm@10.1.0 #&>>/tmp/roboshop.log

echo -e "\e[33mSetup systemd service\e[0m"
cp /home/centos/roboshop-shell-new/catalogue.service /etc/systemd/system/catalogue.service #&>>/tmp/roboshop.log
#cp $pwd/$component.service /etc/systemd/system/$component.service

echo -e "\e[33mStart Catalogue service\e[0m"
systemctl daemon-reload #&>>/tmp/roboshop.log
systemctl enable catalogue #&>>/tmp/roboshop.log
#systemctl enable $component
systemctl start catalogue  #&>>/tmp/roboshop.log
#systemctl restart $component

echo -e "\e[33mCopy mongoDB repo file\e[0m"
cp /home/centos/roboshop-shell-new/mongodb.repo /etc/yum.repos.d/mongodb.repo #&>>/tmp/roboshop.log

echo -e "\e[33mInstalli mongoDB client\e[0m"
#dnf install mongodb-org-shell -y #&>>/tmp/roboshop.log
dnf install mongodb-mongosh -y

echo -e "\e[33mLoad Schema\e[0m"
mongo --host mongodb-dev.prabhanjandevops.store </app/schema/catalogue.js #&>>/tmp/roboshop.log
#mongosh --host mongodb-dev.prabhanjandevops.store </app/db/master-data.js

