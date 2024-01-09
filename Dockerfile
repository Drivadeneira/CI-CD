# Use the official Node.js image as the base image
FROM node:14-alpine

# Create a non-root user to run the application
RUN addgroup -g 1001 appuser && adduser -D -u 1001 -G appuser appuser

# Set the working directory to /app
WORKDIR /app/src

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies as the non-root user
RUN npm install --quiet --no-progress --production

# Copy the rest of the application code to the working directory
COPY . .

# Set the ownership of the working directory to the non-root user
RUN chown -R appuser:appuser /app

# Switch to the non-root user
USER appuser

# Expose the port on which the application will run (if applicable)
# EXPOSE 3000

# Command to run the application
CMD ["node", "index.js"]
