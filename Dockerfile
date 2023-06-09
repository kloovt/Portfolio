# ==== CONFIGURE =====
# Use a Node 16 base image
FROM node:16-alpine as build 
# Set the working directory to /app inside the container
WORKDIR /app
# Copy app files
COPY ./app .
# ==== BUILD =====
# Install dependencies (npm ci makes sure the exact versions in the lockfile gets installed)
RUN npm ci 
# Build the app
RUN npm run build
# # ==== RUN =======
# # Set the env to "production"
# ENV NODE_ENV production
# # Expose the port on which the app will be running (3000 is the default that `serve` uses)
# EXPOSE 3000
# # Start the app
# CMD [ "npx", "serve", "build" ]

FROM nginx:1.23.4 as production
WORKDIR /app
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/my.conf
