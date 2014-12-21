# PHP Wiki Standalone Docker

By default it exposes ports 80 and 443

## Getting the image

    docker pull --tag="pmwiki" docker.mckinley.biz/pmwiki:latest
    
## Running the image

You will need to make the ports available to the outside world using something like:

    docker run -p 80:80 -p 443:443 -i -t pmwiki 
    

## Building

To build it, use:
    
    docker build -t pmwiki .

    
## Credentials
* Shell user: user
* Shell password (for sudo): user
