
FROM maven:3.9.9-eclipse-temurin-17

WORKDIR /app

# Install Chromium and its driver
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Set Chrome binary location
ENV CHROME_BIN=/usr/bin/chromium

# Copy Maven project
COPY pom.xml .
COPY src ./src
COPY webpage ./webpage
COPY testNG.xml .

# Run Selenium TestNG tests
CMD ["mvn", "clean", "test"]
