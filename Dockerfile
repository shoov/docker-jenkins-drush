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

# Install drush
RUN composer global require drush/drush:6.*
RUN ln -sf /var/jenkins_home/.composer/vendor/bin/drush /usr/local/bin/drush

# Switch back to the jenkins user
USER jenkins
