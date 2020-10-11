set -eu

docker run -it --rm -v $(pwd)/honkit:/srv/honkit tukiyo3/honkit honkit build

# ./_book/ が表示できるようにする。 (github pages でアンダースコアから始まるディレクトリが見えない問題対応)
touch honkit/.nojekyll

sudo chown -R $USER:$USER honkit
