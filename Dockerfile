# Base Image
FROM node:15

# Set working directory to app
WORKDIR /app

# Copy over package.json to app direcoty 
COPY package.json .

# # Install all the dependecies
# RUN npm install 

ARG NODE_ENV

RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
        fi

# Copy all files in working directory to the app directory
COPY . .

# Set Environment Var for port
ENV PORT 3000

# Expose the port to access
EXPOSE $PORT

# Command to run the container
CMD ["node", "index.js"]