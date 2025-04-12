#!/bin/bash

# Docker-related setup and Flyway commands
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

TARGET_CONTAINER=""

# Help message
print_help() {
  echo "Usage: $0 [options]"
  echo
  echo "Options:"
  echo "  --container <name>     Start only the specified container"
  echo "  -h, --help             Show this help message"
  exit 0
}

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --container)
      TARGET_CONTAINER="$2"
      shift 2
      ;;
    -h|--help)
      print_help
      ;;
    *)
      echo "${RED}[✗] Unknown argument: $1${RESET}"
      print_help
      ;;
  esac
done

# Start Docker containers
echo
echo "${GREEN}Starting Docker containers...${RESET}"
if [[ -n "$TARGET_CONTAINER" ]]; then
  echo "${GREEN}Target container: $TARGET_CONTAINER${RESET}"
  docker-compose up -d "$TARGET_CONTAINER"
else
  docker-compose up -d
fi