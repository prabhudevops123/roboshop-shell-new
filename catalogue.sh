echo -e "\e[33mInstalling Nginx Server\e[0m"
dnf module disable nodejs -y &>>/tmp/roboshop.log
dnf module enable nodejs:18 -y &>>/tmp/roboshop.log

echo -e "\e[33mInstall NodeJS\e[0m"
dnf install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33Add App user\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33Create App directory\e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33mDownload App content\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33mExtract App Content\e[0m"
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33mInstall NodeJS dependencies\e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[33mSetup systemd service\e[0m"
cp /home/centos/roboshop-shell-new/catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log

echo -e "\e[33mStart Catalogue service\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable catalogue &>>/tmp/roboshop.log
systemctl start catalogue  &>>/tmp/roboshop.log
echo -e "\e[33mCopy mongoDB repo file\e[0m"
cp /home/centos/roboshop-shell-new/mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log

echo -e "\e[33mInstalli mongoDB client\e[0m"
dnf install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[33mLoad Schema\e[0m"
mongo --host mongodb-dev.prabhanjandevops.store </app/schema/catalogue.js &>>/tmp/roboshop.log

