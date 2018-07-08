#!/bin/bash
#Bob Aiello
#DeployWarStep1.sh

echo "DeployWarStep1.sh calculates SHA1 and then deploys WAR file"

sha1sum myArtifactID.war > myArtifactIDwarSHA1.txt

echo "display SHA1 for myArtifactID.war"
cat myArtifactIDwarSHA1.txt

echo "check it"
sha1sum -c myArtifactIDwarSHA1.txt

echo "copy myArtifactID.war and myArtifactIDwarSHA1.txt to web"
scp myArtifactID.war vagrant@web:/home/vagrant/wildfly/standalone/deployments
scp myArtifactIDwarSHA1.txt vagrant@web:/home/vagrant/wildfly/standalone/deployments

echo "checkit on web"
/usr/bin/ssh vagrant@web "cd /home/vagrant/wildfly/standalone/deployments; /usr/bin/sha1sum -c /home/vagrant/wildfly/standalone/deployments/myArtifactIDwarSHA1.txt > /home/vagrant/myArtifactIDwarSHA1.results"
scp vagrant@web:/home/vagrant/myArtifactIDwarSHA1.results .

echo "So does it match?"
cat myArtifactIDwarSHA1.results
