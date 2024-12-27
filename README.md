# InfluxDB + Grafana Monitoring Stack with Docker Compose

This repository provides a quick setup for a monitoring solution using InfluxDB and Grafana, managed with Docker Compose.

InfluxDB is a time-series database for storing and querying large amounts of time-stamped data, and Grafana is an open-source platform for monitoring and observability.

This setup will automatically provision:
- InfluxDB as a data source in Grafana
- A k6 dashboard in Grafana to visualize load test metrics

### Installation

#### Quick Setup

Run the `install.sh` script for an easy setup:

```bash
$ ./install.sh
```

#### Manual Setup

Alternatively, you can set it up manually with the following commands:

```bash
$ docker volume create grafana-volume
$ docker volume create influxdb-volume
$ docker-compose up -d
```

This will start Grafana on port 5050 and InfluxDB on port 8087. These ports and credentials can be configured in the .env file.

### Configuring .env

The following environment variables can be configured in the .env file:

```
# INFLUXDB
INFLUXDB_PORT=8087                # Port for InfluxDB
INFLUXDB_ADMINNAME=admin           # Admin username for InfluxDB
INFLUXDB_ADMINPASS=myadminpassword  # Admin password for InfluxDB
INFLUXDB_ORGNAME=test-org         # Organization name in InfluxDB
INFLUXDB_BUCKETNAME=test-bucket   # Default bucket name for InfluxDB
INFLUXDB_ADMINTOKEN=MyNewAdminToken123==  # Admin token for InfluxDB

# GRAFANA
GRAFANA_PORT=5050                 # Port for Grafana
GRAFANA_ADMIN_USER=admin          # Admin username for Grafana
GRAFANA_ADMIN_PASSWORD=myadminpassword  # Admin password for Grafana
```

### Stopping the Docker Containers

To bring down the stack and stop the services:

```bash
$ docker-compose down
```