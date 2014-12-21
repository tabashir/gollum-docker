# Docker Gollum repo

By default it exposes port 4567

## Credits
* Uses phusion/baseimage https://github.com/phusion/baseimage-docker for easy stable init enviroment
* Uses authentication inspired by: [vigntom](http://stackoverflow.com/users/1820285/vigntom) and [Troels Knak-Nielsen](https://gist.github.com/troelskn)
See: http://stackoverflow.com/questions/9634703/strong-access-control-for-gollum and https://gist.github.com/troelskn/2224709

## Setup
1. clone your document git repo into files/local/gollum/wikidata
1. copy files/local/gollum/users.yml.template to files/local/gollum/users.yml and edit to taste

## Running the image
docker run -p 4567:4567 -v `pwd`/files/local:/local -t gollum /sbin/my_init -- ./serve.sh
