FROM maven:3.5.2-jdk-8-alpine as build

RUN mkdir /app

WORKDIR /app

COPY . .

RUN mvn package

EXPOSE 8080

FROM java:8-jre-alpine

RUN mkdir /app

WORKDIR /app

COPY --from=build /app /app

CMD java -jar hello-dropwizard-1.0.jar server example.yaml
