#!/bin/bash

# Directories related to PostgreSQL data
DATA_DIRS=(
  "./data/searchx_db"
  "./data/combolist_db"
)

# PostgreSQL User and Group ID
PG_UID=1001
PG_GID=1001

# Colors for output formatting
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)
RESET=$(tput sgr0)

# Permission check and fix
echo "${GREEN}Starting permission check for PostgreSQL data directories...${RESET}"

for DIR in "${DATA_DIRS[@]}"; do
  echo
  echo "${GREEN}Checking directory: $DIR${RESET}"

  if [ ! -d "$DIR" ]; then
    echo "${YELLOW}[!] Directory does not exist. Creating: $DIR${RESET}"
    mkdir -p "$DIR"
  fi

  CURRENT_UID=$(stat -c '%u' "$DIR")
  CURRENT_GID=$(stat -c '%g' "$DIR")

  echo "${GREEN}[*] Current permissions:${RESET} UID=$CURRENT_UID, GID=$CURRENT_GID"

  if [[ "$CURRENT_UID" -eq "$PG_UID" && "$CURRENT_GID" -eq "$PG_GID" ]]; then
    echo "${GREEN}[✓] Permissions are correct. No changes needed.${RESET}"
  else
    echo "${YELLOW}[!] Fixing permissions to UID=$PG_UID, GID=$PG_GID...${RESET}"
    sudo chown -R $PG_UID:$PG_GID "$DIR"

    NEW_UID=$(stat -c '%u' "$DIR")
    NEW_GID=$(stat -c '%g' "$DIR")

    if [[ "$NEW_UID" -eq "$PG_UID" && "$NEW_GID" -eq "$PG_GID" ]]; then
      echo "${GREEN}[✓] Permissions updated successfully.${RESET}"
    else
      echo "${RED}[✗] Failed to update permissions for $DIR. Please check manually.${RESET}"
    fi
  fi
done
