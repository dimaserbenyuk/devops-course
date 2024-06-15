# FROM node:18-buster  AS base

# Install dependencies only when needed
ARG NODE_VERSION=20.11.0

FROM node:${NODE_VERSION}-alpine as base
WORKDIR /app
COPY package.json package-lock.json*  ./

FROM base as deps
RUN apk add --no-cache libc6-compat
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --frozen-lockfile

FROM deps as build
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm run postinstall \
    npm install

COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npx prisma generate
RUN npm run build

FROM base as final

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

COPY --from=deps /app/node_modules ./node_modules
COPY --from=build /app/.next/static ./.next/static
COPY --from=build /app/public ./public
COPY --from=build /app/.next/ ./.next
COPY --from=build /app/.env/ ./.env
COPY --from=build /app/prisma/* ./prisma/
COPY --from=build /app/next.config.js ./
COPY --from=build /app/tailwind.config.ts ./
RUN npx prisma generate

EXPOSE 3000

CMD ["npm","start"]

# CMD ["sleep", "3000"]