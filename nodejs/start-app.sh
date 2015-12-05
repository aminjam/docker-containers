#!/bin/bash
cd /home/app/
npm install --production && npm rebuild
bower install --config.interactive=false --allow-root
PORT=3001 npm start --production
