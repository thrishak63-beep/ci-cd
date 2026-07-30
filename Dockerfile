# Stage 1: Build the React application
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the application using Node production preview
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
# Install only production dependencies (lightweight)
RUN npm install --omit=dev
# Copy the compiled production build from the builder stage
COPY --from=builder /app/dist ./dist

EXPOSE 80
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0", "--port", "80"]
