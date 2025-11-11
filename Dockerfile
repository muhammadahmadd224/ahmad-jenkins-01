# 1. Base image
FROM node:18

# 2. Working dir
WORKDIR /app

# 3. Copy package files and install dependencies (cache-friendly)
COPY package*.json ./
RUN npm install --production

# 4. Copy source
COPY . .

# 5. Expose port
EXPOSE 3001

# 6. Start app
CMD ["node", "server.js"]
