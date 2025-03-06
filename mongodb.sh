echo -e "\e[33mCopy mongo DB repo file\e[0m"
cp /home/centos/roboshop-shell-new/mongo.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\e[33mInstalling MongoDB Server\e[0m"
dnf install mongodb-org -y &>>/tmp/roboshop.log

echo -e "\e[33mStart mongoDB server\e[0m"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp

echo -e "\e[33mUpdate mongodb listen address\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongodb.conf


