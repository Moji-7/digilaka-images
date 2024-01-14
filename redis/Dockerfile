
FROM redis

# Set the working directory
WORKDIR /data

# Copy the configuration file
# COPY redis.conf /usr/local/etc/redis/redis.conf

# Expose the port
EXPOSE 6379

# Run the Redis server

CMD [ "redis-server", "--protected-mode", "no", "--appendonly", "yes" ]