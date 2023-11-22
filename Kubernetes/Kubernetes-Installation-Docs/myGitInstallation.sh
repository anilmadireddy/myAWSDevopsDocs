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

echo "----------------------------------cloning myAWSDevopsDocs repository-------------------------------------------"
sleep 5
git clone https://github.com/madireddyanilgit/myAWSDevopsDocs
#git clone https://github.com/madireddyanilgit/GitPractice
#git clone https://github.com/madireddyanilgit/myWebapp
#git clone https://github.com/madireddyanilgit/myAWSDevops-Material
#git clone https://github.com/madireddyanilgit/mySecretData
#git clone https://github.com/madireddyanilgit/webapplication
#git clone https://github.com/madireddyanilgit/myKubeMetrics

echo "----------------------------------cloning myAWSDevopsDocs repository-------------------------------------------"
sleep 5
git remote set-url origin https://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@github.com/anilmadireddy/myAWSDevopsDocs
#git remote set-url origin https://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@github.com/anilmadireddy/myWebapp
#git remote set-url origin https://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@github.com/anilmadireddy/myAWSDevops-Material
#git remote set-url origin https://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@github.com/anilmadireddy/mySecretData
#git remote set-url origin https://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@github.com/anilmadireddy/webapplication
#git remote set-url origin https://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@github.com/anilmadireddy/myKubeMetrics
#git remote set-url origin https://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@github.com/anilmadireddy/GitPractice
