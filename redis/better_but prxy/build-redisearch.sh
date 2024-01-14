

# Clone the repository
# git clone https://github.com/RediSearch/RediSearch.git

# Change to the repository directory
cd RediSearch

# Install the dependencies
make setup

# Build the module file
make build

# Copy the module file to the modules directory
cp build/redisearch.so ../modules
