#!/bin/sh

cat ./config.toml
sed -i -e 's/"\/"#ci://g' ./config.toml
cat ./config.toml
