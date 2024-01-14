FROM alpine:latest

# Install the dependencies
RUN apk update && apk add make gcc g++ curl libc6-compat redis

# Set the working directory
WORKDIR /data

# Copy the build script
COPY ./build-redisearch.sh /build-redisearch.sh

# Copy the configuration file
COPY redis.conf /usr/local/etc/redis/redis.conf

# Run the build script
RUN chmod +x /build-redisearch.sh && /build-redisearch.sh

# Copy the RediSearch module file
COPY ./modules/redisearch.so /modules/redisearch.so

# Expose the port
EXPOSE 6379

# Run the Redis server with the RediSearch module
CMD [ "redis-server", "--loadmodule", "/modules/redisearch.so", "--appendonly", "yes" ]
