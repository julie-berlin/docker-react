
## BUILD PHASE
FROM node:alpine as builder
WORKDIR '/app'
COPY frontend/package.json .
RUN npm install
COPY frontend . 
CMD [ "npm", "run", "build"]

## RUN PHASE 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# default command starts nginx
