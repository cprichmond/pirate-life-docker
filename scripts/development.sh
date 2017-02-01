#!/bin/bash
docker stop pirate-life-blog_DEVELOPMENT
docker rm pirate-life-blog_DEVELOPMENT
docker run -d --name pirate-life-blog_DEVELOPMENT -e NODE_ENV=development -p 2368:2368 -v `pwd`:/var/lib/ghost pirate-life-blog:0.1.0
