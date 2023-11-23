echo "-----------------------Tomcat Installation Process Start----------------------------------------------------------"
echo "-----------------------installing the updates, upgrading and default-jdk------------------------------------------"
echo "-----------------------sudo apt update && sudo apt upgrade -y && sudo apt install default-jdk -y------------------"
sleep 5
sudo apt update && sudo apt upgrade -y && sudo apt install default-jdk -y && sudo apt install sysvbanner -y

echo "-----------------------checking the java version java --version------------------------------------------"
sleep 5
java --version

echo "-----------------------Changing the owner permissions to the /opt------------------------------------------"
echo "-----------------------------sudo chown -R ubuntu:ubuntu /opt----------------------------------------------"
sleep 5
sudo chown -R ubuntu:ubuntu /opt

echo "-----------------------downloading the tomcat "apache-tomcat-9.0.83.tar.gz"------------------------------------------"
sleep 5
wget -P /opt/ https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz

echo "-----------------------unzipping the tomcat files to /opt-------------------------------------------------------------"
echo "-----------------------tar -xvf apache-tomcat-9.0.83.tar.gz-----------------------------------------------------------"
sleep 5
tar -xvf /opt/apache-tomcat-9.0.83.tar.gz -C /opt

echo "-----------------------Taking Backup of context.xml and tomcat-users1.xml-------------------------------------------------------------"
sleep 5
cp /opt/apache-tomcat-9.0.83/conf/tomcat-users.xml /opt/apache-tomcat-9.0.83/conf/tomcat-users1.xml
cp /opt/apache-tomcat-9.0.83/webapps/docs/META-INF/context.xml /opt/apache-tomcat-9.0.83/webapps/docs/META-INF/context1.xml
cp /opt/apache-tomcat-9.0.83/webapps/examples/META-INF/context.xml /opt/apache-tomcat-9.0.83/webapps/examples/META-INF/context1.xml
cp /opt/apache-tomcat-9.0.83/webapps/host-manager/META-INF/context.xml /opt/apache-tomcat-9.0.83/webapps/host-manager/META-INF/context1.xml
cp /opt/apache-tomcat-9.0.83/webapps/manager/META-INF/context.xml /opt/apache-tomcat-9.0.83/webapps/manager/META-INF/context1.xml


echo "-----------------------Applying changes to context.xml and tomcat-users1.xml-------------------------------------------------------------"
sleep 5
cp conf/tomcat-users.xml /opt/apache-tomcat-9.0.83/conf/tomcat-users.xml
cp docs/context.xml /opt/apache-tomcat-9.0.83/webapps/docs/META-INF/context.xml
cp host-manager/context.xml /opt/apache-tomcat-9.0.83/webapps/host-manager/META-INF/context.xml
cp examples/context.xml /opt/apache-tomcat-9.0.83/webapps/examples/META-INF/context.xml
cp manager/context.xml /opt/apache-tomcat-9.0.83/webapps/manager/META-INF/context.xml

echo "-----------------------starting Tomcat Application using startup.sh command-------------------------------------------------------------"
sleep 5
/opt/apache-tomcat-9.0.83/bin/startup.sh
echo "-----------------------Now you can hit tomcat with 'http://<PUBLIC_IP>:8080'------------------------------------------------------------"

sleep 5
banner end of Tomcat
banner installation
sleep 25

echo "-----------------------downloading the apache-maven-3.9.5-bin.zip------------------------------------------"
sleep 5
wget -P /opt https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.zip

echo "-----------------------unzipping the maven files to /opt-------------------------------------------------------------"
echo "-----------------------unzip apache-maven-3.9.5-bin.zip-----------------------------------------------------------"
sleep 5
sudo apt install unzip -y
unzip /opt/apache-maven-3.9.5-bin.zip -d /opt

echo "-----------------------adding environmental variables to /etc/profile---------------------------------------------"
echo "-----------------------M2_HOME=/opt/apache-maven-3.9.5/---------------------------------------------"
sleep 5
sudo cp /etc/profile root/profile1
sudo cp root/profile /etc/profile
sudo chown root:root /etc/profile

echo "----------------------- updating above changes--source /etc/profile-------------------------------------------"
sleep 5
source /etc/profile
sleep 10

echo "-----------------------Checking Maven Version---mvn --version------------------------------------------"
sleep 5
source /etc/profile
mvn --version

sleep 5
banner end of Maven
banner Installation
sleep 5

echo "-----------------------cloning package git------------------------------------------"
sleep 5
git clone https://github.com/anilmadireddy/myWebapp.git

echo "-----------------------Building Package Through Maven------------------------------------------"
source /etc/profile
cp -r myWebapp/* .
sleep 5
mvn clean package

echo "-----------------------Deploying Webapp------------------------------------------"
cp /home/ubuntu/myAWSDevopsDocs/TomcatInstallation/webapp/target/webapp.war /opt/apache-tomcat-9.0.83/webapps/

sleep 5
banner end of webapp
banner Deployment
