dnf install maven -y

echo -e "\e[33mAdd App user\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33mCreate App directory\e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33mDownload App content\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip

cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar

cp /home/centos/roboshop-shell-new/shipping.service /etc/systemd/system/shipping.service

systemctl daemon-reload
systemctl enable shipping
systemctl start shipping

dnf install mysql -y
mysql -h mysql-dev.prabhanjandevops.store -uroot -pRoboShop@1 < /app/schema/shipping.sql
systemctl restart shipping
