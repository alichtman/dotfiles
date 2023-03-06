#!/bin/bash

echo "♫ $(sp.sh metadata | grep title | cut -d"|" -f2)"
