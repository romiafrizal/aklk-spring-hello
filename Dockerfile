FROM maven:3.9.6-eclipse-temurin-21-alpine AS base
WORKDIR /app
COPY . .
RUN mvn clean install

FROM base AS development
WORKDIR /app
COPY --from=base /app/target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar .
EXPOSE 8080
CMD ["java", "-jar", "/app/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar"]
