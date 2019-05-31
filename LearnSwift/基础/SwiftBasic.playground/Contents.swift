//
//  SwiftBasic_String.swift
//  LearnSwfit
//
//  Created by Ht on 2019/5/30.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// 在开始学习之前请记住: 在Swift中 = 号两边必须均有相同的空格数 or 均无空格
//let name = "value"       // 正确
//let name1= "value"      // 错误
//let name3 ="value"      // 错误
//let name2="value"       // 正确 但不美观

// 定义别名。typealias 自定义的名字 = 要定义别名的类型(可以是系统的类型，可以是自己写的类型)
typealias MyInt = Int

// 关键字"let"声明常量  "var"声明变量
// "let"关键已经在IDE层做了值不可变的保证，所以在Swift中的单例写法使用let。后续会说到单例模式及写法

/* 基础语法 */
// tip: 定义过的常量或者变量未曾使用过的话会报警告 可使用下划线替代
let int: MyInt = 0          // let _: MyInt = 0
print(int)

// 下面的写法等同于 let letValue: String = "let"，由于Swift内部做了类型推断，所以可以省略 String
let letValue = "这是一个将会被用到的常量"

//        letValue = ""     // 如果你去修改常亮值会发现Xcode会报错 "Cannot assign to value: 'XXX' is a 'let' constant"
var varValue = "这是一个变量"
varValue = "改变后"                  // var就能修改
print(varValue)                        // 输出 "改变后"

// 常量、变量的定义声明，延伸一点好玩的东西。Swift的变量名可以使用emoji表情 or 中文做变量名，但是作为一名正经的程序猿就别用这些命名了，实际运用也不方便
// eg:
let 🐶 = "🐶"
let 🐈 = "🐱"
let 狗 = "dog"
let 猫 = "cat"
let num1 = 1
let num_1 = 1
print(🐶)
print(狗)
