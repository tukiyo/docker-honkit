set -eu

docker run -it --rm -v $(pwd)/honkit:/srv/honkit tukiyo3/honkit honkit build
sudo chown -R $USER honkit
