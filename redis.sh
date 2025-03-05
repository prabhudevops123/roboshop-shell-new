echo -e "\e[33m Enable Redis 7 version \e[0m"
dnf module disable redis -y &>>/tmp/roboshop.log
dnf module enable redis:7 -y &>>/tmp/roboshop.log

echo -e "\e[33m Install Redis \e[0m"
dnf install redis -y &>>/tmp/roboshop.log

echo -e "\e[33m Update redis listen address \e[0m"
sed -i -e 's|127.0.0.1|0.0.0.0|' -e '/protected-mode/ c protected-mode no' /etc/redis/redis.conf #&>>/tmp/roboshop.log
#sed -i -e 's|127.0.0.1|0.0.0.0|' -e /etc/redis.conf /etc/redis/redis.conf &>>/tmp/roboshop.log

echo -e "\e[33m start redis service \e[0m"
systemctl enable redis &>>/tmp/roboshop.log
systemctl start redis &>>/tmp/roboshop.log