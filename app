#!/bin/bash
npm start
while read line; do export "$line";
done < .env
chromium-browser --disable-xss-auditor --app=https://localhost:$PORT_HTTPS
