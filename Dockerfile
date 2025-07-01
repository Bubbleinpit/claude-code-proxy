# 选择官方 Python 镜像
FROM python:3-slim

# 安装 uv
RUN pip install --upgrade pip && pip install uv

# 设置工作目录
WORKDIR /app

# 复制项目文件
COPY . /app

# 安装依赖（uv 会自动识别 requirements.txt 或 pyproject.toml/uv.lock）
# RUN uv pip install -r requirements.txt

# 或者如果你用的是 pyproject.toml + uv.lock，可以用：
RUN uv pip install --use-uv

# 设置启动命令
EXPOSE 8082
CMD ["python", "start_proxy.py"]