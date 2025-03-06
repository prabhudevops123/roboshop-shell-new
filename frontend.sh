yum install nginx -y

systemctl enable nginx
systemctl restart nginx

rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

# we need to copy config file


#echo -e "\e[33mInstalling Nginx Server\e[0m"
#dnf module disable nginx -y &>>/tmp/roboshop.log
#dnf module enable nginx:1.24 -y &>>/tmp/roboshop.log
#dnf install nginx -y &>>/tmp/roboshop.log
#
##cp nginx.conf /etc/nginx/nginx.conf
#echo -e "\e[33mStarting nginx server\e[0m"
#systemctl enable nginx &>>/tmp/roboshop.log
#systemctl start nginx &>>/tmp/roboshop.log
#
#echo -e "\e[33mRemoving old app content\e[0m"
#rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log
#
#echo -e "\e[33mDownloading frontend content\e[0m"
#curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>>/tmp/roboshop.log
#
#echo -e "\e[33mExtract frontend content\e[0m"
#cd /usr/share/nginx/html
#unzip /tmp/frontend.zip &>>/tmp/roboshop.log
#
#echo -e "\e[33mFrontend Configuration\e[0m"
#cp /home/ec2-user/roboshop-shell-new/nginx.conf /etc/nginx/nginx.conf &>>/tmp/roboshop.log
#
#systemctl restart nginx


##echo -e "${color} Installing Nginx Server ${nocolor}"
#echo -e "\e[33mInstalling Nginx Server\e[0m"
#yum install nginx -y &>>/tmp/roboshop.log
#
#echo -e "\e[33mRemoving old app content\e[0m"
#rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log
#
#echo -e "\e[33mDownloading frontend content\e[0m"
#curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log
#
#echo -e "\e[33mExtract frontend content\e[0m"
#cd /usr/share/nginx/html
#unzip /tmp/frontend.zip &>>/tmp/roboshop.log
#
##echo -e "\e[33mFrontend Configuration\e[0m"
##cp /home/centos/roboshop-shell-new/roboshop.conf /etc/nginx/default.d/roboshop.conf &>>/tmp/roboshop.log
#
#echo -e "\e[33mStarting nginx server\e[0m"
#systemctl enable nginx &>>/tmp/roboshop.log
#systemctl restart nginx &>>/tmp/roboshop.log



