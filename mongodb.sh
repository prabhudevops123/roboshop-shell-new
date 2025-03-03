echo -e "\e[33mCopy mongo DB repo file\e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log

echo -e "\e[33mInstalling MongoDB Server\e[0m"
dnf install mongodb-org -y &>>/tmp/roboshop.log

# Modify the conf file

echo -e "\e[33mStart mongoDB server\e[0m"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl start mongod &>>/tmp/roboshop.log
