```bash
mkdir jenkins-persist
cd jenkins-persist

docker run -d --name=jenkins -p 8080:8080 -v /home/USERNAME/jenkins-persist:/var/jenkins_home amitaibu/jenkins-drush
```
