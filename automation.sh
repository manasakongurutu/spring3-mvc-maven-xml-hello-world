#!/bin/bash
docker build -t manasamidhuna/test:${BUILD_NUMBER} .
cat ./my_password.txt | docker login --username foo --password-stdin
docker push manasamidhuna/test:${BUILD_NUMBER}
docker pull manasamidhuna/test:${BUILD_NUMBER}
docker run -it -d -p 8081:8080 --name test_${BUILD_NUMBER} manasamidhuna/test:${BUILD_NUMBER}
