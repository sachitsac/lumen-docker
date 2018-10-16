#!/bin/bash

command=$1

case "$command" in
        log)
            docker logs -f $2
            ;;
        ps)
            docker-compose -f docker-compose.yml ps
            ;;
        composer)
            docker exec -it fsm-app php composer.phar $2 $3 $4
            ;;        
        start)
            docker-compose -f docker-compose.yml up -d
            ;;
        stop)
            docker-compose -f docker-compose.yml down
            ;;        
        artisan)
            docker exec -it php-app php artisan $2 $3 $4
            ;;
        *)
            echo $"Usage: $0 {composer|start|stop|artisan|log {container_name}|ps}"
            exit 1
esac