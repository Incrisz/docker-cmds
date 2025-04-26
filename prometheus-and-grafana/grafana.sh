# Pull and run Grafana Docker container
echo "Setting up Grafana..."
docker pull grafana/grafana
docker run -d -p 3000:3000 --name=grafana grafana/grafana