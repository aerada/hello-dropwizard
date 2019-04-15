FROM jamesdbloom/docker-java8-maven
WORKDIR /app
COPY pom.xml /app/pom.xml
COPY src /app/src
COPY example.yaml /app/example.yaml
RUN  curl -O -u admin:admin123  http://104.211.214.150:8081/nexus/content/repositories/releases/com/pragtech/hello-dropwizard/1.0/hello-dropwizard-1.0.jar
EXPOSE 8080
CMD sh start.sh
