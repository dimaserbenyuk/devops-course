# FROM node:18-alpine AS runtime
# WORKDIR /app
# COPY package*.json ./
# RUN npm ci --only=production
# COPY .next ./.next
# COPY public ./public

# # Set the environment variable to production
# ENV NODE_ENV=production

# # Run postinstall script to generate Prisma client
# RUN npm run postinstall

# EXPOSE 3000
# USER node
# CMD ["npm","start"]

# using staged builds
FROM node:18-buster as builder
# make the directory where the project files will be stored
# set it as the working directory so that we don't need to keep referencing it
WORKDIR /todo
# Copy the package.json file
COPY package*.json tailwind.config.ts tsconfig.json postcss.config.js /todo/

# RUN npm ci

RUN npm install

# ENV NODE_ENV development
ENV PORT 3000

ARG NODE_ENV=development
ENV NODE_ENV $NODE_ENV
# COPY .next ./.next
# COPY public ./public

# install project dependencies
# RUN npm install
# copy project files 
# make sure to set up .dockerignore to copy only necessary files
COPY . .

# ARG NODE_ENV=production
# ENV NODE_ENV $NODE_ENV
# ENV PORT 3000
# run the build command which will build and export html files

# RUN npm ci

RUN npm fund


RUN npm run build

# bundle static assets with nginx
FROM nginx:1.21.0-alpine as production


ARG NODE_ENV=development
ENV NODE_ENV $NODE_ENV
# # remove existing files from nginx directory
RUN rm -rf /usr/share/nginx/html/*
# # copy built assets from 'builder' stage
COPY --from=builder /todo/.next/ /usr/share/nginx/html
# add nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf
# expose port 80 for nginx
EXPOSE 80
# start nginx
CMD ["nginx", "-g", "daemon off;"]
# CMD ["npm","start"]