#!/bin/bash

cd content/posts/

# 示例：重命名单个文件 image.png
file="image.png"
base="${file%.*}"    # 文件名（不含扩展名）：image
ext="${file##*.}"    # 扩展名：png

# 获取最后修改时间的时间戳（秒 + 纳秒）
timestamp=$(stat -c %Y "$file")           # 秒（Unix 时间戳）
nanosec=$(stat -c %N "$file" | tr -cd 0-9) # 纳秒部分（如 813000000）

# 将秒转换为 YYYYMMDDHHMMSS 格式
datetime=$(date -d "@$timestamp" "+%Y%m%d%H%M%S")

# 取纳秒的前三位作为毫秒
millis=$(printf "%03d" $((nanosec / 1000000)))

# 组合成完整时间戳：YYYYMMDDHHMMSSmmm
full_timestamp="${datetime}${millis}"

# 新文件名
new_name="${base}-${full_timestamp}.${ext}"

# 重命名
mv "$file" "../../static/img/$new_name"

echo "重命名为: $new_name"

cd -