#!/bin/sh

set -euo pipefail

# Running this script will copy the `fly.toml` and create a new app.
fly launch --no-cache --copy-config --build-only --auto-confirm
echo "Please wait while an IP is allocated on fly.io..."
fly ips allocate-v4
echo "Now go to https://admin.defined.net to create a lighthouse and use the above IP ^"
echo "once you've done this, press enter to continue..."
read -r _
printf "Enrollment code: "
read -r CODE
fly deploy -e DN_ENROLLMENT_CODE="$CODE"
