图片生成首选**硅基流动 SiliconFlow**（国内直连、免费 200 次/天）：Kolors 模型做小红书中文卡片（1080×1440），FLUX.1-dev 做公众号封面（1440×1080）。备用 Pollinations.ai（免费但质量差）。⚠️ Hermes credential sanitizer 会在 execute_code/terminal 中截断 API key→401，解决：让包哥手动 `echo 'key' > /tmp/sf_key.txt`，脚本从文件读取 key。详细 API 文档见 ai-learning-content-workflow 技能的 references/siliconflow-api.md。生成前先检查目录是否已有内容，避免重复。
§
创建了两个技能: (1) hermes-multi-machine — 跨电脑 git 同步 Hermes 记忆的完整方案, (2) ai-learning-content-workflow — 包哥的 90 天 AI 学习 + 小红书/公众号每日内容发布工作流, 包含目录结构、平台差异、进度追踪、图片生成规范。
§
图片生成环境状态 (2026-05-26): FAL 余额耗尽需充值, OpenAI API key (sk-e27ae...) 无效需更换, xAI 未配 key, OpenAI Codex 未 OAuth 登录。代理 172.31.16.1:7892 可用但 curl 需显式 --proxy 参数。切换图片后端: hermes config set image_gen.provider <fal|openai|xai|openai-codex>。
§
图片生成: 硅基流动 Key 在 /tmp/sf_key.txt，Kolors 模型可用但中文效果差。包哥之前用腾讯混元效果好，正在配置腾讯云 SecretId/SecretKey。混元接入需腾讯云签名（非 Bearer Token）。FAL 余额耗尽，OpenAI Key 无效+被墙。Pollinations.ai 免费但质量差、限速。
§
包哥对图片质量要求高：AI 直接生成的含中文图片（Kolors/Pollinations）"外星人也看不懂"，宁可用 Pillow 纯代码渲染保证文字清晰。明确说过"千万别存 skill"——图片生成方案不要创建新 skill。提到和 workbuddy 差距不小，标准以 workbuddy 时期产出为参照。
§
硅基流动 (SiliconFlow) API Key 存储在 /tmp/sf_key.txt。用于图片生成等外部 API 调用。硅基流动支持多个国产模型：通义万相 Z-Image-Turbo（阿里，推荐）、百度 ERNIE-Image-Turbo、Qwen/Qwen-Image、Kwai-Kolors/Kolors。API 地址 https://api.siliconflow.cn/v1/images/generations，Bearer Token 认证。免费额度每天 200 次。腾讯混元已确认将于 2026 年 9 月 30 日停服，不可投资。
§
图片生成：硅基流动 API Key 在 /tmp/sf_key.txt。可用模型：通义万相 Z-Image-Turbo（1.3MB/张）、通义千问 Qwen-Image（570KB/张）、Kwai-Kolors/Kolors。余额 ¥11.69，每日免费 200 次。图片规格：小红书 1080×1440，公众号 1440×1080。
§
包哥对图片要求：浅蓝科技风（RGB ~224,241,252 底、~30,136,229 蓝点缀、白色主内容），参考 Day5-Day9 卡片风格。AI 生中文图曾全部翻车（Kolors/Pollinations/FAL），通义万相和通义千问新测。包哥多次提到和 workbuddy 差距大，标准以此为准。深海蓝配色被明确否决。