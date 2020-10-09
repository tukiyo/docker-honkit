set -ue

docker run -it --rm -v $(pwd)/honkit:/srv/honkit tukiyo3/honkit honkit pdf
ls -lh honkit/book.pdf
