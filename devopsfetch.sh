#!/bin/bash

# Function to display help
show_help() {
  echo "Usage: $0 [OPTION]..."
  echo "Retrieve and monitor server information."
  echo ""
  echo "Options:"
  echo "  -p, --port            Display all active ports and services"
  echo "  -p <port_number>      Provide detailed information about a specific port"
  echo "  -d, --docker          List all Docker images and containers"
  echo "  -d <container_name>   Provide detailed information about a specific container"
  echo "  -n, --nginx           Display all Nginx domains and their ports"
  echo "  -n <domain>           Provide detailed configuration information for a specific domain"
  echo "  -u, --users           List all users and their last login times"
  echo "  -u <username>         Provide detailed information about a specific user"
  echo "  -t, --time            Display activities within a specified time range"
  echo "  -h, --help            Display this help and exit"
}

# Function to display all active ports and services
display_ports() {
  sudo netstat -tuln
}

# Function to provide detailed information about a specific port
port_details() {
  sudo lsof -i :$1
}

# Function to list all Docker images and containers
list_docker() {
  sudo docker ps -a
  sudo docker images
}

# Function to provide detailed information about a specific container
docker_details() {
  sudo docker inspect $1
}

# Function to display all Nginx domains and their ports
display_nginx() {
  sudo nginx -T
}

# Function to provide detailed configuration information for a specific domain
nginx_details() {
  sudo nginx -T | grep -A 10 "server_name $1;"
}

# Function to list all users and their last login times
list_users() {
  lastlog
}

# Function to provide detailed information about a specific user
user_details() {
  lastlog | grep $1
}

# Function to display activities within a specified time range
time_range() {
  echo "Time range functionality not implemented yet."
}

# Parse command-line options
while [[ "$#" -gt 0 ]]; do
  case $1 in
    -p|--port) shift; if [[ "$1" =~ ^[0-9]+$ ]]; then port_details $1; else display_ports; fi ;;
    -d|--docker) shift; if [[ -n "$1" ]]; then docker_details $1; else list_docker; fi ;;
    -n|--nginx) shift; if [[ -n "$1" ]]; then nginx_details $1; else display_nginx; fi ;;
    -u|--users) shift; if [[ -n "$1" ]]; then user_details $1; else list_users; fi ;;
    -t|--time) shift; time_range $1 ;;
    -h|--help) show_help; exit 0 ;;
    *) echo "Unknown parameter passed: $1"; show_help; exit 1 ;;
  esac
  shift
done

