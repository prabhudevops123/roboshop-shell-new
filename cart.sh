echo -e "\e[33mConfiguring NodeJS\e[0m"

dnf module disable nodejs -y #&>>/tmp/roboshop.log
dnf module enable nodejs:20 -y #&>>/tmp/roboshop.log

echo -e "\e[33mInstall NodeJS\e[0m"
dnf install nodejs -y #&>>/tmp/roboshop.log

echo -e "\e[33mAdd App user\e[0m"
useradd roboshop #&>>/tmp/roboshop.log

echo -e "\e[33mCreate App directory\e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33mDownload App content\e[0m"
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip  &>>/tmp/roboshop.log

cd /app

echo -e "\e[33mExtract App Content\e[0m"
unzip /tmp/cart.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33mInstall NodeJS dependencies\e[0m"
npm install

echo -e "\e[33mSetup systemd service\e[0m"
cp /home/centos/roboshop-shell-new/cart.service /etc/systemd/system/cart.service &>>/tmp/roboshop.log


echo -e "\e[33mStart Cart service\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable cart &>>/tmp/roboshop.log
systemctl start cart  &>>/tmp/roboshop.log

