FROM node:18
WORKDIR /app
RUN apt-get update && apt-get install git
RUN git clone https://github.com/harkaur02/Lab-Chat-Example.git /app
# RUN npm cache clean --force && npm install
RUN npm install 
CMD ["node","index.js"]
EXPOSE 3000