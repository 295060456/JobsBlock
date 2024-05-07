#!/bin/bash

# 默认邮箱和用户名
default_email="lg295060456@gmail.com"
default_username="Jobs"

# 获取当前文件夹路径
current_directory=$(dirname "$(realpath "$0")")
cd "$current_directory"  # 切换到当前目录

# 获取当前文件夹内后缀名为podspec的文件名列表，并存储到数组中
podspec_files=()
while IFS= read -r -d '' file; do
    podspec_files+=("$file")
done < <(find . -maxdepth 1 -type f -name "*.podspec" -print0)

if [ ${#podspec_files[@]} -eq 0 ]; then
    echo "No podspec files found in the current directory."
    exit 1
fi

# 输入邮箱
read -p "Enter email (default: $default_email): " email
email=${email:-$default_email}

# 输入用户名
read -p "Enter username (default: $default_username): " username
username=${username:-$default_username}

# 执行pod spec lint命令，并在每个文件通过lint后推送到CocoaPods
for podspec_file in "${podspec_files[@]}"; do
    echo "Linting $podspec_file"
    if pod spec lint --allow-warnings --verbose "$podspec_file"; then
        echo "去点击邮箱验证，以继续"
        pod trunk register "$email" "$username"
        read -p "Do you want to continue? Press Enter to continue, any other key to abort." choice
        if [ -z "$choice" ]; then
            echo "Continuing..."
        else
            echo "Operation aborted."
            exit 1
        fi
        echo "Pushing $podspec_file to CocoaPods"
        pod trunk push "$podspec_file"
    else
        echo "Failed to lint $podspec_file. Skipping push to CocoaPods."
    fi
done

# 添加本地提交代码操作
echo -e "\n ------ 执行 git 本地提交代码操作 ------ \n"
read -p "Enter commit message (default: 基础的配置): " git_commit_des
git_commit_des=${git_commit_des:-"基础的配置"}  # 设置默认提交描述信息
echo "git add ."
git add .
echo "git status"
git status
echo "git commit -m ${git_commit_des}"
git commit -m "${git_commit_des}"

# 添加打标签tag，并推送到远端
echo -e "\n ------ 执行 git 打标签tag，并推送到远端 ------ \n"
pod_spec_version="1.0.0"  # 设置标签版本号
echo "git tag ${pod_spec_version}"
git tag "${pod_spec_version}"
echo "git push origin master --tags"
git push origin master --tags

:<<'COMMENT'
pod spec lint 和 pod lib lint 都是用于校验 CocoaPods 规范的命令，但它们的使用场景略有不同。

pod spec lint：
这个命令用于校验一个单独的 .podspec 文件的规范性，即一个 CocoaPods 组件的描述文件。
pod spec lint 命令会验证 .podspec 文件的语法、依赖关系、作者信息等是否符合 CocoaPods 的规范。

pod lib lint：
这个命令也用于校验一个 CocoaPods 组件，但它会在本地模拟建立一个空项目，并将该组件集成到项目中，然后执行一系列的检查。
pod lib lint 命令会检查组件是否可以正确地集成到一个项目中，包括编译、链接、资源文件等等。
区别主要在于两者的检查范围和深度：

pod spec lint 只是对 .podspec 文件本身进行静态分析，确保其符合规范。
pod lib lint 则会更适合确保一个 CocoaPods 组件可以正确地被集成到项目中，以及在项目中的行为是否符合预期。

所以，一般来说，pod spec lint 用于对单个 .podspec 文件的静态规范进行校验，
而 pod lib lint 则更适合确保一个 CocoaPods 组件可以正确地被集成到项目中。

COMMENT
