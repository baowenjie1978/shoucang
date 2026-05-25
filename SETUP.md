# 新电脑设置指南

## 1. SSH 密钥
ssh-keygen -t ed25519 -C "baowenjie@hermes-sync" -f ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
# ↑ 贴到 https://github.com/settings/keys

## 2. 克隆仓库
git clone git@github.com:baowenjie1978/shoucang.git ~/.hermes/hermes-sync
rm -rf ~/.hermes/memories
ln -s ~/.hermes/hermes-sync/memories ~/.hermes/memories

## 3. 同步脚本
mkdir -p ~/.hermes/scripts
cp ~/.hermes/hermes-sync/sync.sh ~/.hermes/scripts/sync.sh

## 4. 代理配置（WSL 访问 Windows 主机的 FASTLINK）
# 先确认 Windows 主机 IP（通常是 WSL 网关）
# 然后把下面写入 ~/.bashrc 和 ~/.hermes/.env：
# export HTTP_PROXY=http://<Windows主机IP>:7892
# export HTTPS_PROXY=http://<Windows主机IP>:7892
# export ALL_PROXY=socks5://<Windows主机IP>:7892

## 5. Cron 定时同步
# 在 Hermes 里说「配一下 cron 同步」，我来设
