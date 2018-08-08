#!/bin/shcat

echo "Wait MariaDB..."
echo "On container: "$1;
echo "On port: "$2;
until nc -z $1 $2; do
    sleep 1
done
echo "Done"

php-fpm