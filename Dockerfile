# Use an official Node.js runtime as a base image
FROM node:20-alpine

# Set environment variables inside the container
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# Create a directory /home/app inside the container
RUN mkdir -p /home/app

# Copy the application code from app directory to /home/app directory inside the container
COPY ./app /home/app

# Sets the working directory (in this case /home/app) for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile
WORKDIR /home/app

# Executes the npm install command inside the /home/app directory
RUN npm install

# Defines the default command to run when a container is started based on this image
CMD [ "node", "server.js" ]
