FROM centos:7
# Installing Java
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
ENV PATH=$PATH:$JAVA_HOME
RUN yum install java-1.8.0-openjdk-devel wget -y
EXPOSE 8080

# Installing Maven
ENV Mvn_Version=3.6.3 
ENV M2_HOME=/usr/local/apache-maven/apache-maven-${Mvn_Version}
ENV M2="${M2_HOME}/bin"
ENV PATH=$PATH:$M2
    
RUN wget https://downloads.apache.org/maven/maven-3/${Mvn_Version}/binaries/apache-maven-${Mvn_Version}-bin.tar.gz && \
    tar xvfz apache-maven-${Mvn_Version}-bin.tar.gz && \
    mkdir /usr/local/apache-maven/apache-maven-${Mvn_Version} -p && \
    mv apache-maven-${Mvn_Version}/* /usr/local/apache-maven/apache-maven-${Mvn_Version}/


# Installing and configuring Tomcat

WORKDIR /opt/myapplication/
RUN mvn clean install && cp /opt/myapplication/target/spring3-mvc-maven-xml-hello-world-1.0-SNAPSHOT.war /opt/tomcat/webapps/myapp.war
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
