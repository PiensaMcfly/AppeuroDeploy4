FROM maven:3.8.2-jdk-11 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM adoptopenjdk:openj9
COPY --from=build /target/AppEuro-0.0.1-SNAPSHOT.jar AppEuro-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "AppEuro-0.0.1-SNAPSHOT.jar"]