//
//  LearnSwfit
//  Created by Ht.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// Class 类。
// Swift的类是构建代码所用的一种通用且灵活的构造体
// 可以为类定义属性(常量、变量)和方法
// Swift的类与OC不同的是不需要在不同的文件中分别声明和实现方法。Swift的类声明和实现都在同一个文件里

/*  类和结构体的相同点
    1、可以定义
 */

// 语法，eg:
//class MothedName: SuperClass {
//    Definition 1
//    Definition 2
//    ......
//    Definition N
//}
// Swift的类在开发大多时候是继承自OC类NSObject，这样就能使用NSObject的一些属性和方法
// 也可以不继承
class Animal {
    // 语法
//    init(parameters) {
//
//    }
    // 自定义构造方法
    init(name: String) {
        self.name = name
    }
    
    // 计算属性可以用于类、结构体和枚举; 存储属性只能用于类和结构体。
    
    // 计算属性。必须用var关键字声明，必须声明属性的类型，如果想要修改属性的值必须写set方法
    // 计算属性不直接存储值，而是提供一个get 可选set方法来间接获取 or 设置其他属性或变量的值
    var heartbeat: Int {        // 计算属性，只读
        return 60
    }
    
    // 计算属性，可读可写
    var food: String {
        set {
            print("set\(newValue)")
            if newValue == "🦴" {
                name = "🐶"
            }
        }
        get {
            return "食物"
        }
    }
    // 上面说到set，延伸一点。属性观察器: willSet、didSet。当你给一个存储属性赋值时这两个方法的依次调用
    var test: String = "" {
        willSet {
            print("将要设置test的值为: \(newValue)")
        }
        didSet {
            print("已经设置test的值为: \(test)")
        }
    }
    
    // 存储属性。用于存储值
    var name = ""
    
    // 懒加载。指当第一次调用的时候才会对其进行初始化，然后再在内存中开辟其指针的存放空间，。语法: 使用lazy关键字修饰，必须使用var声明
    // 可以在声明时直接赋初始值
    lazy var testLazy = String("hello")
    // 也可以使用闭包的形式进行初始化
    lazy var testLazy1: String = {
        let str = "hello"
        return str
    }()
    
    // 实例化方法，通过实例对象调用
    func eat() {
        print("eatting")
    }
    
    // 类方法，有的语言也叫静态方法。使用static关键字修饰。通过类名调用
    static func eat() {
        print("static eatting")
    }
    
    // self属性。类型的每一个实例都有一个隐含属性叫self，self完全等同于该实例本身。
    func testSelf() {
        print(self.food)        // 一般情况下别使用self，除非特定情况，如闭包内。
    }
    
}

// 实例化一个Animal实例对象
let animal = Animal(name: "旺财")
print(animal.food)          // 食物
animal.food = "🦴"
animal.test = "hello"
print(animal.test)
print(animal.food)          // 🦴
print(animal.name)         // 🐶
print(animal.testLazy1)
animal.eat()
Animal.eat()
