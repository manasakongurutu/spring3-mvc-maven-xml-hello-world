#!/bin/bash
docker build -t z12bsobh/test:${BUILD_NUMBER} .
cat ./my_password.txt | docker login --username foo --password-stdin
docker push z12bsobh/test:${BUILD_NUMBER}
docker pull z12bsobh/test:${BUILD_NUMBER}
docker run -it -d -p 8081:8080 --name test_${BUILD_NUMBER} z12bsobh/test:${BUILD_NUMBER}
