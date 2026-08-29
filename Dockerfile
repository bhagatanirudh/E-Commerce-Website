# Use official Tomcat with OpenJDK 11
FROM tomcat:9.0-jdk11

# Remove default ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the exploded webapp from the project
COPY src/main/webapp /usr/local/tomcat/webapps/ROOT

# If compiled classes are present in build/classes, copy them into WEB-INF/classes
# (the project repository contains build/classes/ with compiled .class files)
COPY build/classes /usr/local/tomcat/webapps/ROOT/WEB-INF/classes

# Copy any bundled jars if present
COPY src/main/webapp/WEB-INF/lib /usr/local/tomcat/webapps/ROOT/WEB-INF/lib

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
