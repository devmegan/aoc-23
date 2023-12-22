FROM ubuntu:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gfortran

COPY /solutions /app/solutions
COPY /fixtures /app/fixtures

WORKDIR /app
CMD ["./program"]