docker run -d --name zerotier \
  --restart unless-stopped \
  --device=/dev/net/tun \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_ADMIN \
  -p 9993:9993/udp \
  zerotier/zerotier
