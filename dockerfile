# 1. Use the official CommandBox image (Includes OS, Java, and Undertow Web Server)
FROM ortussolutions/commandbox:latest

# 2. Set the engine to Adobe ColdFusion 2025
ENV ENGINE=adobe@2025

# 3. Define the webroot directory for the container
ENV APP_DIR=/app

# 4. Copy your local CFML/HTML files directly into the container's webroot
COPY . /app/

# 5. Expose the port CommandBox's internal web server uses
EXPOSE 8080

# 6. Explicitly run the server in the foreground
# The --console flag keeps the process attached to the container's output
CMD ["box", "server", "start", "serverHomeDirectory=/serverHome", "host=0.0.0.0", "port=8080", "openBrowser=false", "--console"]