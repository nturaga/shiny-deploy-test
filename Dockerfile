FROM ghcr.io/rocker-org/shiny:4.2.3

RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com/')"

# Copy configuration files into the Docker image
COPY shiny-server.conf  /etc/shiny-server/shiny-server.conf
COPY /app /srv/shiny-server/
RUN rm /srv/shiny-server/index.html

# Make the ShinyApp available at port 80
EXPOSE 80

# Copy further configuration files into the Docker image
COPY shiny-server.sh /usr/bin/shiny-server.sh
RUN ["chmod", "+x", "/usr/bin/shiny-server.sh"]
CMD ["/usr/bin/shiny-server.sh"]
