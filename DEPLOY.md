# Docker + Kamal Setup

## Prerequisites
- Docker Hub account (or GHCR)
- EC2 instance (Ubuntu 22.04 recommended, t3.small+)
- EC2 SSH key pair
- Domain pointing to EC2 IP

## 1. Add Kamal to Gemfile
```ruby
gem "kamal", require: false
```
Run: `bundle install`

## 2. Make entrypoint executable
```bash
chmod +x bin/docker-entrypoint
```

## 3. Configure deploy.yml
Edit `config/deploy.yml` — replace:
- `your-dockerhub-username` → your Docker Hub username
- `YOUR_EC2_IP` → your EC2 public IP
- `yourdomain.com` → your domain
- `myapp` → your app name

## 4. Set secrets (.env on your local machine, NOT committed)
```
KAMAL_REGISTRY_PASSWORD=your_dockerhub_password
RAILS_MASTER_KEY=your_master_key_from_config/master.key
SECRET_KEY_BASE=$(openssl rand -hex 64)
```

## 5. EC2 setup (first time)
```bash
kamal setup
```
This installs Docker on EC2, pushes image, starts container with Traefik proxy + SSL.

## 6. Deploy
```bash
kamal deploy
```

## Common commands
```bash
kamal app logs          # tail logs
kamal app exec 'rails console'
kamal rollback          # rollback to previous
kamal app restart
```

## SQLite persistence
SQLite DB lives at `/data/myapp/storage` on the EC2 host, mounted into the container.
Back this up periodically via cron + S3 or use `litestream` for replication.
