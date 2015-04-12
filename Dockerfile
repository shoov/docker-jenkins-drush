FROM jenkins
MAINTAINER Gizra
# Switch to root
USER root

# Update and install packages
RUN apt-get update
RUN apt-get install -y curl zsh git vim
RUN apt-get install -y -q php5-cli php5-curl

# Install composer globally
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# Switch back to the jenkins user
USER jenkins
