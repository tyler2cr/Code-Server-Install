# Install code-server
# docs: https://coder.com/docs/code-server/install#debian-ubuntu

VERSION=4.100.0

mkdir -p ~/.local/lib ~/.local/bin
curl -vfL https://github.com/coder/code-server/releases/download/v$VERSION/code-server-$VERSION-linux-amd64.tar.gz \
  | tar -C ~/.local/lib -xz
mv ~/.local/lib/code-server-$VERSION-linux-amd64 ~/.local/lib/code-server-$VERSION
ln -sf ~/.local/lib/code-server-$VERSION/bin/code-server ~/.local/bin/code-server
export PATH="$HOME/.local/bin:$PATH"
code-server --bind-addr 0.0.0.0:8080 &

echo "
Now visit http://127.0.0.1:8080.
Your password is in ~/.config/code-server/config.yaml
"

