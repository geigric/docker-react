FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

FROM nginx
# the next line has 3 parameters:
# --from=builder: means import from phase builder 
#   what was in the folder /app/build
# then, set the output from nginx to the specified folder
COPY --from=builder /app/build /usr/share/nginx/html
