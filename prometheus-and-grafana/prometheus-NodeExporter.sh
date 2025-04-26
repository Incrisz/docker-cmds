#!/bin/bash

# Define Prometheus and Node Exporter versions
PROMETHEUS_VERSION="2.41.0"
NODE_EXPORTER_VERSION="1.5.0"

# Download and extract Prometheus
echo "Downloading Prometheus..."
wget https://github.com/prometheus/prometheus/releases/download/v$PROMETHEUS_VERSION/prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz
tar -xvf prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz
sudo mv prometheus-$PROMETHEUS_VERSION.linux-amd64 /usr/local/bin/prometheus
rm prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz

# Start a new tmux session for Prometheus
tmux new-session -d -s prometheus_session

# Download and extract Node Exporter
echo "Downloading Node Exporter..."
wget https://github.com/prometheus/node_exporter/releases/download/v$NODE_EXPORTER_VERSION/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz
tar -xvf node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz
rm node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz
mv node_exporter-$NODE_EXPORTER_VERSION.linux-amd64 /usr/local/bin/node_exporter

# Create Prometheus configuration
echo "Configuring Prometheus..."
cat <<EOT > /usr/local/bin/prometheus/prometheus.yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

# Alertmanager configuration
alerting:
  alertmanagers:
    - static_configs:
        - targets:

# Load rules once and periodically evaluate them according to the global 'evaluation_interval'.
rule_files:

# Scrape configurations
scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]

  - job_name: "node_exporter"
    static_configs:
      - targets: ["44.202.40.76:9100"]
EOT

# Run Node Exporter in a tmux session
tmux new-session -d -s node_exporter_session "/usr/local/bin/node_exporter/node_exporter"

# Run Prometheus in a tmux session with the updated configuration
tmux send-keys -t prometheus_session "cd /usr/local/bin/prometheus && ./prometheus --config.file=prometheus.yml" C-m

# Pull and run Grafana Docker container
# echo "Setting up Grafana..."
# docker pull grafana/grafana
# docker run -d -p 3000:3000 --name=grafana grafana/grafana

echo "Setup complete!"
