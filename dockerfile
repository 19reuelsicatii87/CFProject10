# Step 1: Use the official CommandBox image as the base
# This image already has Java, CommandBox, and an operating system configured.
FROM ortussolutions/commandbox:latest

# Step 2: Set environment variables inside the container
# CommandBox uses these to automatically spin up the engine (e.g., Adobe CF 2025)
ENV APP_DIR=/app
ENV ENGINE=adobe@2025

# Step 3: Copy your dependency management files first
# This is a Docker best practice to leverage layer caching (speeding up builds)
COPY box.json ./

# Step 4: Run box install to download your ColdBox app production dependencies
RUN box install --production

# Step 5: Copy the rest of your application code into the container
# Instead of using rsync commands in a build script, we will use a .dockerignore file 
# to automatically filter out test files, .git, and local dev files.
COPY . .

# (Optional) Expose the port CommandBox runs on internally (usually 8080)
EXPOSE 8080