FROM node:latest

RUN apt update && apt -y upgrade
RUN apt -y install build-essential 

RUN npm install -g @vue/cli

EXPOSE 3000