FROM quay.io/quarkus/centos-quarkus-maven:19.3.1-java8

RUN chmod -R g+rwx /home/quarkus 

COPY ./pom.xml ./pom.xml
COPY ./src ./src
EXPOSE 8080

CMD ["mvn", "-Duser.home=/home/quarkus", "compile", "quarkus:dev"]