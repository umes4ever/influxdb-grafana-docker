#!/usr/bin/env bash

# Exit the script immediately if any command fails
set -e

# Current working directory
WORKDIR=$(pwd)

# Check if docker and docker-compose are installed
if [[ $(which docker) ]] && [[ $(which docker-compose) ]]; then
  echo "Starting the installation of your new InfluxDB + Grafana monitoring stack!"
  echo ""

  # Create Docker volumes for Grafana and InfluxDB
  echo "Creating Docker volumes: 'grafana-volume' and 'influxdb-volume'"
  docker volume create grafana-volume
  docker volume create influxdb-volume
  echo ""

  # Start Docker Compose in detached mode
  echo "Starting Docker Compose"
  docker-compose up -d
  echo ""

  # Check the status of running Docker containers
  echo "Checking Docker container status"
  docker ps
else
  echo "Docker or Docker Compose not installed or not configured properly. Please install them first and then try again."
  exit 1
fi