# Add cloudflare gpg key
sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null

# Add this repo to your apt repositories
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | sudo tee /etc/apt/sources.list.d/cloudflared.list

# install cloudflared
sudo apt-get update && sudo apt-get install cloudflared

cloudflared tunnel run --token eyJhIjoiODhmYzQ0ZjA1ZjBhNDQxYTAwZjA0ZTM4ZGM3YmQ5MGIiLCJ0IjoiOGMyYjJiMzctNTdmYS00NGU1LWE0OTctNjY5MDA3MTJlNzlhIiwicyI6Ikl1YUxNd2szK2FleDFNS3RRTHN4cTVNVDNUU1BTRTNOL08xL2QvVFFkQ1E9In0=
