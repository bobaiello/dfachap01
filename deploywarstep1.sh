#!/bin/bash
#Bob Aiello
#DeployWarStep1.sh

echo "hi there"
sha1sum myArtifactID.war > myArtifactIDwarSHA1.txt

echo "$mySHA1"
cat myArtifactIDwarSHA1.txt

echo "check it"
sha1sum -c myArtifactIDwarSHA1.txt

echo "copy myArtifactIDwarSHA1.txt to web"
scp myArtifactIDwarSHA1.txt vagrant@web:/home/vagrant

echo "checkit on web"
/usr/bin/ssh vagrant@web "/usr/bin/sha1sum myArtifactIDwarSHA1.txt > myArtifactIDwarSHA1.results"
