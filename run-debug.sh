set -e;
echo ============================== Building Test Image =============================
docker build -t my-debug -f "$PWD/debug/Dockerfile" $PWD/debug
echo ============================== Starting Test =============================
docker run --rm -v "$PWD/keys:/etc/ssl/mysql" -v "$PWD/debug/code:/code" --link my-mysql my-debug -c "php82 /code/main.php"
