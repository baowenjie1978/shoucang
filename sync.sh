#!/bin/bash
# Hermes 记忆自动同步脚本
# 每 30 分钟由 cron 触发，自动 pull → commit → push

set -e

REPO="$HOME/.hermes/hermes-sync"
LOG="$HOME/.hermes/logs/sync.log"

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG"; }

cd "$REPO"

# 1. 如果有远程仓库，先拉取其他电脑的更新
REMOTE=$(git remote get-url origin 2>/dev/null || true)
if [ -n "$REMOTE" ]; then
    if git pull --rebase origin main 2>>"$LOG"; then
        log "拉取成功"
    else
        log "拉取失败（网络问题或远程不可用，跳过）"
    fi
fi

# 2. 暂存所有变更
git add -A

# 3. 没有变更就退出
if git diff --cached --quiet; then
    exit 0
fi

# 4. 提交
git commit -m "auto-sync: $(date '+%Y-%m-%d %H:%M')" >>"$LOG" 2>&1
log "本地提交完成"

# 5. 推送到远程（如果有）
if [ -n "$REMOTE" ]; then
    if git push origin main 2>>"$LOG"; then
        log "推送成功"
    else
        log "推送失败（稍后重试）"
    fi
fi
