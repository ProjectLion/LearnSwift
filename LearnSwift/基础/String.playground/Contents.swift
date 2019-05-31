//
//  SwiftBasic_String.swift
//  LearnSwfit
//
//  Created by Ht on 2019/5/30.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// 在Swift中String类型是值类型。如果创建新的String值，则在将String值传递给函数或方法时，或者将其赋值给常量或变量时，将复制该String值

// 字符串的拼接
var str1 = "str1"
let str2 = "str2"
let _ = str1 + str2         // 可以直接使用 + 号进行拼接 (常用)
let _ = String(format: "%@%@", str1, str2)          // 也可以使用String的初始化方法提供的占位符的方式拼接
let _ = "\(str1)\(str2)"        // 也可以直接使用Swift中String的占位符语法拼接 (常用)
print(str1.append(str2))

let mp4Str = "tEst.mP4"
// Swift String提供了判断是否包含某前缀 or 后缀的方法
if mp4Str.hasPrefix("test") {
    print("包含test前缀")
} else {
    print("不包含test前缀")
}
// mp4Str.hasSuffix("mp4")      // 后缀
// mp4Str.contains(".")        // 该方法用于判断整个字符串中是否包含某个字符

// Swift提供了将整个String转为大写 or 小写的方法。该方法是返回新字符串value，并未改变原始的mp4Str
print("大写: " + mp4Str.uppercased())
print("小写: " + mp4Str.lowercased())

// String的截取
print("移除首字符: " + mp4Str.dropFirst())       // 该方法是返回新字符串value，并未改变原始的mp4Str
print("移除末尾字符: " + mp4Str.dropLast())

if let range = mp4Str.range(of: ".m") {
    print(mp4Str[..<range.lowerBound])      // 输出tEst
    print(mp4Str[range.upperBound...])      // 输出p4
    print(mp4Str.prefix(upTo: range.lowerBound))        // 输出tEst
    print(mp4Str.suffix(from: range.upperBound))        // 输出p4
} else {
    print("没有找到.m的位置")
}
