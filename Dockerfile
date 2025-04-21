FROM oven/bun:1 AS build
WORKDIR /app
COPY package*.json ./
RUN bun install --frozen-lockfile
COPY . .
RUN bunx --bun astro telemetry disable \
  && bunx --bun astro build \
  ;

FROM nginx:1.27-alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
USER nginx
CMD ["nginx", "-g", "daemon off;"]
