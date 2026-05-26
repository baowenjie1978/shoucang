图片生成首选**硅基流动 SiliconFlow**（国内直连、免费 200 次/天）：Kolors 模型做小红书中文卡片（1080×1440），FLUX.1-dev 做公众号封面（1440×1080）。备用 Pollinations.ai（免费但质量差）。⚠️ Hermes credential sanitizer 会在 execute_code/terminal 中截断 API key→401，解决：让包哥手动 `echo 'key' > /tmp/sf_key.txt`，脚本从文件读取 key。详细 API 文档见 ai-learning-content-workflow 技能的 references/siliconflow-api.md。生成前先检查目录是否已有内容，避免重复。
§
创建了两个技能: (1) hermes-multi-machine — 跨电脑 git 同步 Hermes 记忆的完整方案, (2) ai-learning-content-workflow — 包哥的 90 天 AI 学习 + 小红书/公众号每日内容发布工作流, 包含目录结构、平台差异、进度追踪、图片生成规范。
§
包哥对图片质量要求高：AI 直接生成的含中文图片（Kolors/Pollinations）"外星人也看不懂"，宁可用 Pillow 纯代码渲染保证文字清晰。明确说过"千万别存 skill"——图片生成方案不要创建新 skill。提到和 workbuddy 差距不小，标准以 workbuddy 时期产出为参照。
§
图片生成：硅基流动 API Key 在 /tmp/sf_key.txt。可用模型：通义万相 Z-Image-Turbo（1.3MB/张）、通义千问 Qwen-Image（570KB/张）、Kwai-Kolors/Kolors。余额 ¥11.69，每日免费 200 次。图片规格：小红书 1080×1440，公众号 1440×1080。
§
包哥对图片要求：浅蓝科技风（RGB ~224,241,252 底、~30,136,229 蓝点缀、白色主内容），参考 Day5-Day9 卡片风格。AI 生中文图曾全部翻车（Kolors/Pollinations/FAL），通义万相和通义千问新测。包哥多次提到和 workbuddy 差距大，标准以此为准。深海蓝配色被明确否决。
§
已下载 yao-open-prompts（12 个精选提示词）和 Agent-Learning-Hub 路线图到 D:\work\llm_study\。学习资料目录：Agent学习路线.md、你的Agent学习对照表.md、yao-prompts/。用户正在 Stage 1（最小 Agent Loop），对应 90 天计划的 Day 16-33。
§
漫画风格偏好：manga（日漫风格）。做知识漫画默认用 manga + warm tone，竖版 3:4。已通过 baoyu-comic skill 验证可用。
§
包哥想做知识付费，方向：自媒体引流→微信私域成交。最终目标是训练营（39-69元/期），先以低价PDF资料包（1.99-3.99元）引流试水。核心要求：价格低但质量绝对不能差，不能砸口碑。形式不走网站，走小红书+公众号→私域微信。大部分内容由我（Hermes）产出，包哥负责发布、互动、收钱、交付。目前状态：想法讨论阶段，继续各自思考、随时交流，达成共识后再动手。初始方向建议用"AI做小红书封面"切入，但包哥也愿意听其他思路。
§
微信配置总结：平台名 "weixin"，cron deliver 格式 weixin:o9cq803K6LMxmDH7AaXO5zv5lWm4@im.wechat。发文件：放 ~/.hermes/document_cache/，cron agent 回复中输出绝对路径即可被 weixin adapter 自动提取发送。已修改 weixin.py trust_env=False（防 WSL 代理劫持）。⚠️ .env 中的代理变量会被网关加载覆盖 shell 设置，代理断时必须从 .env 移除。网关通过 ~/.hermes/start-gateway-clean.sh 启动（清代理+NO_PROXY=*），systemd 已禁用。
§
Codex Desktop 配置 DeepSeek：wire_api 必须为 "chat"（"responses" 会静默卡死无输出），config.toml 在 C:\Users\阳光学校微机室1\.codex\。auth.json 需同时配 OPENAI_API_KEY 和 DEEPSEEK_API_KEY 指向同一 DeepSeek Key。relay 在 localhost:4445。Windows 环境变量用 setx 设置。