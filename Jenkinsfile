pipeline{
    agent any
    stages{
        stage("scm"){
            steps{
                git "https://github.com/manasakongurutu/spring3-mvc-maven-xml-hello-world"
            }
        }
        stage("build"){
            steps{
                sh "docker build -t manasamidhuna/test:${BUILD_NUMBER} ."
            }
        }
        stage("docker"){
            steps{
                sh"""
                docker login -u manasamidhuna -p manasa@123
                docker push manasamidhuna/test:${BUILD_NUMBER}
                """
            }
        }
        stage("pull docker image"){
            steps{
                sh"""
                docker pull manasamidhuna/test:${BUILD_NUMBER}
                docker run -it -d -p 8081:8080 --name test_${BUILD_NUMBER} manasamidhuna/test:${BUILD_NUMBER}
                """
            }
        }
    }
}
