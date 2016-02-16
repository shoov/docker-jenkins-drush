> Jenkins with Drush

## Installation & Usage

This docker should be executed from a directory that will hold all the configuration and logs (i.e. a persistent folder).

```shell
cd ~
mkdir jenkins-persist
cd jenkins-persist

# Run the docker container.
docker run -d --name=jenkins -p 8080:8080 -v /home/USERNAME/jenkins-persist:/var/jenkins_home amitaibu/jenkins-drush
```

## Adding Drush Site Aliases

If you are dealing with hosting service providers such as Pantheon, you can download the site aliases. Here is for example how to download the file from [Pantheon](https://pantheon.io/docs/articles/local/drupal-drush-command-line-utility/#download-and-move-the-file-manually)


Under `jenkins-persist`

```shell
mkdir .drush
touch pantheon.aliases.drushrc.php

#
# Populate the site alises you've downloaded into pantheon.aliases.drushrc.php
# ...

# Verify site alias are loaded
docker exec -i -t jenkins drush sa --strict=0

# Authorize site alias for the first time
docker exec -i -t jenkins drush @site-alias status --strict=0
```

Notice the last command to authorize the site alias. If for example your site alias is `pantheon.foo.live`, then the command should be `docker exec -i -t jenkins drush @pantheon.foo.live status --strict=0`

### SSH keys

Note that if you are using a hosting service providers such as Pantheon, you will need to [add the SSH keys](https://pantheon.io/docs/articles/users/loading-ssh-keys/) of the new machine under your Pantheon account
