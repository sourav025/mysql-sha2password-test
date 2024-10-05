docker rm -f my-mysql || { echo "$?"; }
docker run --name my-mysql \
    -v "$PWD/confd:/etc/mysql/conf.d" \
    -e MYSQL_ROOT_PASSWORD=adminpass \
    -d \
    -p "3306:3306" \
    -v "$PWD/keys:/etc/ssl/mysql" \
    mysql:8.0.39 \
    --character-set-server=utf8mb4 \
    --collation-server=utf8mb4_unicode_ci

echo "Waiting for 10sec for mysql server to start!!!"
sleep 10;

docker exec -it my-mysql sh -c "mysql -uroot -padminpass < /etc/mysql/conf.d/init.sql" && {
  echo "Successfully inserted to mydb.authors and created user sha2user"
}

