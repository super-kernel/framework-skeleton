# Composer 脚本设置
COMPOSER_CMD=composer dump-autoload -o --classmap-authoritative

# SuperKernel 执行器路径
BIN=php bin/super-kernel.php

# 清理路径
CONTAINER_CACHE=target

# .PHONY 逻辑目标
.PHONY: prepare-autoload clean-container dev start build

# 生成 classmap（强制开启 classmap-authoritative 模式）
prepare-autoload:
	@echo "📦 Generating Composer classmap..."
	$(COMPOSER_CMD)

# 清理容器缓存（统一入口）
clean-container:
	@echo "🧹 Cleaning container cache..."
	rm -rf $(CONTAINER_CACHE)

# 开发模式启动（watch）
dev: prepare-autoload clean-container
	@echo "🚀 Starting SuperKernel in watch mode..."
	$(BIN) server:watch

# 正式运行
start: prepare-autoload clean-container
	@echo "🚀 Starting SuperKernel in normal mode..."
	$(BIN) start

# 预构建模式
build: prepare-autoload clean-container
	@echo "🏗️  Building SuperKernel application..."

	$(BIN) run:build