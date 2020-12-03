pipeline{
    agent any
    stages{
        stage("scm"){
            steps{
                git "https://github.com/grvsobha/spring3-mvc-maven-xml-hello-world"
            }
        }
        stage("build"){
            steps{
                sh "docker build -t z12bsobh/test:${BUILD_NUMBER} ."
            }
        }
        stage("docker"){
            steps{
                sh"""
                cat my_password.txt | docker login --username foo --password-stdin
                docker push z12bsobh/test:${BUILD_NUMBER}
                """
            }
        }
        stage("pull docker image"){
            steps{
                sh"""
                docker pull z12bsobh/test:${BUILD_NUMBER}
                docker run -it -d -p 8081:8080 --name test_${BUILD_NUMBER} z12bsobh/test:${BUILD_NUMBER}
                """
            }
        }
    }
}
