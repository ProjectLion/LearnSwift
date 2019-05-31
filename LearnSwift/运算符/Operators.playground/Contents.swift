//
//  SwiftBasic_String.swift
//  LearnSwfit
//
//  Created by Ht on 2019/5/30.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// 基础运算符。Swift的基础运算符与大多数语言的基础运算符用法一致。下面只提几个特殊的

// ">"、"<"、">="、"<="。比较运算符，在Swift中字符串可以直接进行比较
let str1: String = "a"
let str2 = "b"
print(str1 > str2)
// 输出 false。
// 因为String类型实现了Equatable协议方法
// 如果字符串是字母则比较acci码的值，如果字符串是数字则比较数值的大小

// "==="、"!=="。Swift提供的这两个标识运算符用于判断两个对象是否都引用的同一个实例
class Person {
    init() {
        
    }
}
let p1 = Person()
let p2 = p1
print(p1 === p2)            // 输出 ''true''
