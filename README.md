```shell
mkdir jenkins-persist
cd jenkins-persist

docker run -d --name=jenkins -p 8080:8080 -v /home/USERNAME/jenkins-persist:/var/jenkins_home amitaibu/jenkins-drush

# Verify site alias
docker exec -i -t jenkins drush sa --strict=0

# Authorize site alias for the first time
docker exec -i -t jenkins drush @site-alias status --strict=0
```
