openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout ~/.config/code-server/self.key \
  -out ~/.config/code-server/self.crt \
  -subj "/CN=localhost"