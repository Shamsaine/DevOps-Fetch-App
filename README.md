# DevOps-Fetch App

DevOpsFetch is a tool for retrieving and monitoring server information, including active ports, user logins, Nginx configurations, Docker images, and container statuses. It includes a systemd service to monitor and log these activities continuously.

## Installation

### Prerequisites

- Docker
- npm and Node.js
- Git
- PM2
- Python3

### Setup

1. **Clone the repository and navigate into it:**

```sh
git clone <your-repo-url>
cd <your-repo-directory>
```

2. **Run the setup scripts to install dependencies and configure the environment:**

```sh
chmod +x setup.sh setup2.sh
./setup.sh
./setup2.sh
```
### Usage

**Run the devopsfetch.sh script with the desired options:**

```sh
./devopsfetch.sh -p
./devopsfetch.sh -d
./devopsfetch.sh -n
./devopsfetch.sh -u
```
#### Options

- `-p, --port:` Display all active ports and services
    - `-p <port_number>:` Provide detailed information about a specific port
- `-d, --docker:` List all Docker images and containers
    - `-d <container_name>:` Provide detailed information about a specific container
- `-n, --nginx:` Display all Nginx domains and their ports
    - `-n <domain>:` Provide detailed configuration information for a specific domain
- `-u, --users:` List all users and their last login times
    - `-u <username>:` Provide detailed information about a specific user
- `-t, --time:` Display activities within a specified time range
- `-h, --help:` Display this help and exit

### Logging

Logs are stored in /var/log/devopsfetch.log. Log rotation is managed with logrotate to ensure log files do not consume excessive disk space.

### Systemd Service

DevOpsFetch is configured to run as a systemd service. To enable and start the service, run:

```sh
sudo systemctl enable devopsfetch
sudo systemctl start devopsfetch
sudo systemctl status devopsfetch
```

By following these steps, you'll have a fully functioning devopsfetch tool for server information retrieval and monitoring, complete with a systemd service for continuous operation and comprehensive documentation for easy usage and maintenance.

©shamsaine