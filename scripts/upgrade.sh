#!/bin/bash
docker stop pirate-life-blog_PRODUCTION
docker rm pirate-life-blog_PRODUCTION
docker run -d --name pirate-life-blog_PRODUCTION -e TARGET_THEME=pirate-life-theme -e NODE_ENV=production -p 80:2368 -v /usr/share/ghost-blogs/pirate-life-blog:/var/lib/ghost pirate-life-blog:0.1.0
