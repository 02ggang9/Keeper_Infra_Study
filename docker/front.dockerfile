# Builder Image
FROM node:14 as builder
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/KEEPER31337/Homepage-Front.git /usr/src/app
WORKDIR /usr/src/app
RUN npm install
RUN npm run build

# Running Image
FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html