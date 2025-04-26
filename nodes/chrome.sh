sudo docker run -d --name chrome --rm -it --shm-size=512m -p 6901:6901 -e VNC_PW=password kasmweb/chrome:1.16.0


The container is now accessible via a browser : https://IP_OF_SERVER:6901

User : kasm_user
Password: password