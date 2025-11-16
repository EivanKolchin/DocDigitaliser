#!/usr/bin/env bash
set -euo pipefail

ENV_FILE=".env"

cat <<'MSG'
This setup script creates a .env file that stores the MongoDB connection
information required by the DocDigitaliser services. Two different MongoDB
connection strings are requested:
  1. MONGODB_PRIMARY_URI  - the database used by the running application.
  2. MONGODB_ARCHIVE_URI  - a separate database (or cluster) that stores
     archived digitised documents.
If you intend to use the same MongoDB cluster for both, provide the same
connection string at both prompts.
MSG

read -r -p "Enter the MongoDB connection string for the primary database: " primary_uri
if [[ -z "$primary_uri" ]]; then
    echo "Error: primary connection string cannot be empty" >&2
    exit 1
fi

read -r -p "Enter the MongoDB connection string for the archive database: " archive_uri
if [[ -z "$archive_uri" ]]; then
    echo "Error: archive connection string cannot be empty" >&2
    exit 1
fi

cat > "$ENV_FILE" <<EOF_ENV
MONGODB_PRIMARY_URI=$primary_uri
MONGODB_ARCHIVE_URI=$archive_uri
EOF_ENV

cat <<MSG

$ENV_FILE created successfully. Update it anytime if your credentials change.
MSG
