echo "----------------------------------Installing Git----------------------------------------------------"
sleep 5
sudo apt install git


echo "----------------------------------Checking Git Version--------------------------------------------------------"
sleep 5
git --version

echo "----------------------------------Initiating the github-------------------------------------------------------"
sleep 5
git init

echo "----------------------------------Checking Git remoteVersion--------------------------------------------------"
sleep 5
git remote -v

echo "----------------------------------Checking Git config list----------------------------------------------------"
sleep 5
git config --list

echo "----------------------------------Configuring the Git username and email--------------------------------------"
sleep 5
git config --global user.email "anilreddy.m8@gmail.com"
git config --global user.name "anilmadireddy"

echo "----------------------------------Checking Git config list----------------------------------------------------"
sleep 5
git config --list

echo "----------------------------------cloning myAWSDevopsDocs repository-------------------------------------------"
sleep 5
#git clone https://github.com/anilmadireddy/myAWSDevopsDocs.git
#git clone https://github.com/anilmadireddy/GitPractice
#git clone https://github.com/anilmadireddy/myWebapp
#git clone https://github.com/anilmadireddy/myAWSDevops-Material
#git clone https://github.com/anilmadireddy/mySecretData
#git clone https://github.com/anilmadireddy/webapplication
#git clone https://github.com/anilmadireddy/myKubeMetrics

echo "----------------------------------cloning myAWSDevopsDocs repository-------------------------------------------"
sleep 5
#git remote set-url origin https://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@github.com/anilmadireddy/myAWSDevopsDocs
#git remote set-url origin https://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@github.com/anilmadireddy/myWebapp
#git remote set-url origin https://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@github.com/anilmadireddy/myAWSDevops-Material
#git remote set-url origin https://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@github.com/anilmadireddy/mySecretData
#git remote set-url origin https://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@github.com/anilmadireddy/webapplication
#git remote set-url origin https://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@github.com/anilmadireddy/myKubeMetrics
#git remote set-url origin https://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@github.com/anilmadireddy/GitPractice

