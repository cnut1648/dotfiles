#!/bin/bash

# title: copy_without_linebreaks
# author: Glutanimate (github.com/glutanimate)
# license: MIT license

# For Chinese OCR books
# sometimes text is
# 灭 谛 ,是 说 灭 除 贪 爱 欲 望 ,便 断 除 了 产 生 苦 恼 的 原 因 ,使 自 己 永 远 不 再 轮 回 于 生 死 苦 海 。这 是 原 始 佛 教 所 追 求 的 最 高 境 界 。 《阿 含 经 》上 经 常 看 到 释 迦 牟 尼 所 说 自 己 达 到 的 至 高 解 脱 境 界 是 : “我 生 已 尽 ,  烦 恼 已 灭 ,所 作 已 办 ,不 受 后 有 ”,就 是 “灭 谛 ”的 实 现 , 也就是所谓涅槃。
# will remove all empty space

SelectedText="$( /usr/bin/xsel )"

ModifiedText="$(printf "%s" "$SelectedText" | \
    awk 'BEGIN { FS = OFS = "\0" } { gsub(/[[:space:]]/, ""); gsub(/,/, "，"); gsub(/:/, "："); gsub(/\./, "。"); printf "%s", $0 } END{ print "" }')"

echo "$ModifiedText" | /usr/bin/xsel -bi
