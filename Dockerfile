# Usa uma imagem base do OpenJDK para rodar o seu JAR
FROM openjdk:17-jdk-slim

# Expõe a porta que a sua aplicação usa (padrão do Spring Boot)
EXPOSE 8080

# Adiciona o arquivo JAR da sua aplicação ao container
# O comando "gradlew bootJar" cria o JAR em build/libs
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

# Define o comando para rodar a aplicação quando o container iniciar
ENTRYPOINT ["java","-jar","/app.jar"]