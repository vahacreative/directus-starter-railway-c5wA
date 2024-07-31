FROM node:18-bullseye

# Install Python and other necessary tools
RUN apt-get update && apt-get install -y python3 python3-pip build-essential

# Set working directory
WORKDIR /app

# Copy package.json
COPY package.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Set environment variables
ENV NODE_ENV=production
ENV PYTHON=/usr/bin/python3

# Start the application
CMD ["npm", "start"]
