//
//  LearnSwfit
//  Created by Ht.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// 结构体 struct。结构体属于值类型，这意味着在程序传递过程中它总是被复制。

// 结构体拥有和类差不多的功能:
// 一、定义构造方法(构造器)
// 二、定义方法
// 三、定义存储属性，计算属性
// 四、实现拓展功能
// 五、遵循协议，并实现协议方法
// 六、通过拓展添加新的方法、计算属性

// 与类不同的是:
// 一、不能使用类型转换在运行时检查和解释类的实例类型
// 二、不能继承
// 三、没有引用计数，类有引用计数(所以在接收服务器数据时常用Struct，而尽量避免用Class)

// eg:
struct Person {
    // 定义属性
    var name: String = "test"
    var age: Int = 10
    
    // 在结构体中如果我们没有自定义构造器，那么系统会默认提供一个包含了所有成员变量作为参数的构造器
//    init(name: String = "text", age: Int = 10) {
//        self.name = name
//        self.age = age
//    }
    
    // 定义方法。在自定义的方法内如果有修改结构体的属性值时必须在func前添加 mutating 关键，表示可变操作
    mutating func change(newAge num: Int) {
        age = num
    }
}

let person = Person(name: "ht", age: 18)        // 这里调用的构造器我们在结构体内并没有实现
var copyPerson = person         // 被复制了一份
copyPerson.name = "Ht"
copyPerson.change(newAge: 20)
print(person)
print(copyPerson)

