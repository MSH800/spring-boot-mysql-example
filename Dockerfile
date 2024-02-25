FROM maven:ibmjava AS mvn
COPY . .
RUN mvn clean install
FROM openjdk:17-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY --from=mvn ./target/spring-boot-mysql-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]