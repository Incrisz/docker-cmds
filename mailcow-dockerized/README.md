https://github.com/christianlempa/videos/tree/main/mailcow-tutorial




sudo git clone https://github.com/mailcow/mailcow-dockerized

cd mailcow-dockerized

sudo ./generate_config.sh

mail.humucarecleaning.co.uk

nano mailcow.conf

http=81
https=444

<!-- rm docker-compose.yml

use my docker-compose.yml file  -->

sudo docker compose pull
sudo docker compose up -d

https://www.youtube.com/watch?v=_z6do5BSJmg



docker rmi $(docker images | grep mailcow | awk '{print $3}') -f
