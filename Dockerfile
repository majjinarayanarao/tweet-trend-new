FROM tomcat:latest

# Set working directory for copying webapps.dist contents
WORKDIR /usr/local/tomcat/webapps.dist

# Copy contents of webapps.dist to webapps directory
RUN cp -R * ../webapps

# Set working directory back to Tomcat root directory
WORKDIR /usr/local/tomcat

# Copy WAR files into webapps directory
COPY ./*.war /usr/local/tomcat/webapps
