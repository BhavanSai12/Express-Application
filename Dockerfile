# Use an Offical Node.js runtime as a parent image
FROM node:16-apine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

#Install the dependencies
RUN npm install 

# Copy the rest of the application code to the container
COPY . .

# Expose port for the app to listen on
EXPOSE 3000

# Start the app
CMD [ "node","index.js" ]