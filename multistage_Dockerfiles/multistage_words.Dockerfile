FROM maven:latest as back
COPY . /words
WORKDIR /words/
RUN mvn verify

FROM alpine:latest
RUN apk --update add openjdk17-jre
WORKDIR /app
COPY --from=back /words/target ./target
CMD ["java","-jar", "/app/target/words.jar"]
EXPOSE 8080
