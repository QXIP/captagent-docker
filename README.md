
![homer](http://i.imgur.com/ViXcGAD.png)

# CAPTAGENT 6 Docker
http://sipcapture.org

Status: 

* [![Build Status](https://travis-ci.org/QXIP/captagent-docker.svg?branch=master)](https://travis-ci.org/QXIP/homer-docker)

* Initial working prototype - Testing Needed!
 
### Pull latest
```
docker pull qxip/captagent-docker
```

### Run latest using --net=host
```
docker run -tid --name captagent6 --net=host qxip/captagent-docker
```

### Local Build & Test
```
git clone https://github.com/qxip/captagent-docker; cd captagent-docker
docker build --tag="qxip/captagent-docker:local" ./
docker run --net=host -t -i qxip/captagent-docker:local
```


