if [ ! -f dockerfile/Dockerfile ];then
    echo "[quit] docker-compose.yml のある場所で実行してください。"
fi
docker build . -f dockerfile/Dockerfile -t tukiyo3/honkit
