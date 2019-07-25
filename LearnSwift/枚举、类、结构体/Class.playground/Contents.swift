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
// Swift的类在开发中没有特定父类时大多时候是继承自OC类NSObject，这样就能使用NSObject的一些属性和方法，方便。
// 也可以不继承
class Animal {
    // 语法
//    init(parameters) {
//
//    }
    // 在Class中分为两种构造器init: 指定构造器和便利构造器
    // 指定构造器: 在一个类中必须至少有一个(当我们的类继承自NSObject时，NSObject已经定义了指定构造器，可选择重写或者不重写)，因为它是类的主要构造器。所以类的实例初始化都会调用指定构造器，当没有自定义指定构造器时系统会默认生成一个不带参的指定构造器
    // 便利构造器: 使用关键字convenience修饰，属于横向代理。也就是说在定义时必须调用本类的一个构造器(可以是指定构造器 or 便利构造器)
    // 指定构造器
    init(name: String) {
        // 在指定构造器中必须给本类的成员变量赋上初始值(如果成员变量没有初始值)，也就是说在Swift的Class中所有的成员变量必须有初始值。并且该赋值行为必须要在调用父类的指定构造器之前(如果有父类，本示例没有)
        self.name = name
        self.age = 10
    }
    // 在声明这个变量时可以不赋初始值，但是在指定构造器中必须给它赋值，否则会报错
    var age: Int
    
    // 存储属性。用于存储值。这个变量赋了初始值，在指定构造器中可以选择性的给它赋值
    var name = ""
    
    // 私有变量，子类无法继承
    private var six: Int = 0
    
    // 常量
    let tag = 10
    
    // 便利构造器 使用convenience关键字修饰
    convenience init(pram: String) {
        // 必须调用本类的任意一个构造器。
        self.init(name: pram)
    }
    
    // 计算属性可以用于类、结构体和枚举; 存储属性只能用于类和结构体。
    
    // 计算属性。必须用var关键字声明，必须声明属性的类型，如果想要修改属性的值必须写set方法
    // 计算属性不直接存储值，而是提供一个get 可选set方法来间接获取 or 设置其他属性或变量的值
    var heartbeat: Int {        // 计算属性，只读。当只有get时可省略get方法，直接return
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
    var home: String = "" {
        willSet {
            print("将要设置test的值为: \(newValue)")
        }
        didSet {
            print("已经设置test的值为: \(home)")
        }
    }
    
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
    static func staticEat() {
        print("static eatting")
    }
    
    // self属性。类型的每一个实例都有一个隐含属性叫self，self完全等同于该实例本身。
    fileprivate func testSelf() {
        print(self.food)               // 一般情况下不使用self，除非特定情况，如闭包内。
    }
    
}

// 实例化一个Animal实例对象
let animal = Animal(name: "旺财")         // 这是调用了我们自定义的init(name: String)，直接用()，省略了init
print(animal.food)                  // 食物
animal.food = "🦴"
animal.home = "hello"
print(animal.home)                  // hello
print(animal.food)                 // 🦴
print(animal.name)                // 🐶
print(animal.testLazy1)         // hello
animal.eat()                        // eatting
Animal.staticEat()                        // static eatting

/// 类的继承
//class ClassName: SuperClass {
//
//}
class Dog: Animal {
    
    // 类的继承，使用override关键字修饰。子类能够从父类那里继承到:
    // 一、指定构造器
    // 首先，构造器默认是不继承的，如果子类中实现了自定义的指定构造器，那么就可以不用继承父类的指定构造器; 如果没有定义指定构造器，那么就会自动继承父类所有的指定构造器
    init(name: String, breed: String) {
        self.breed = breed
        // 在子类的指定构造器中必须调用父类的指定构造器。且在调用父类的指定构造器前，必须要确保这个类的成员变量必须得有值，也就是给本类的成员变量赋初始值的行为必须在调用父类构造器之前
        super.init(name: name)
    }
    var breed: String
    
    // 重写。使用override关键字修饰
    // 重写父类的构造器
//    override init(name: String) {
//        breed = ""
//        super.init(name: name)
//    }
    
    // 二、计算属性
    override var home: String {
        set {
            print(newValue)
        }
        get {
            return "China"
        }
    }
    
    // 三、存储属性。确切的说是继承了存储属性的属性观察器
    // 在父类中的name属性下我们并没有为其添加属性观察器，这里 却可以继承得到，这就说明系统是默认为存储属性添加了属性观察器，但是没有做任何实现
    override var name: String {
        willSet {
            print("子类的willSet")
        }
        didSet {
            print("子类的didSet")
        }
    }
    
    // 四、方法
    override func eat() {
        // 可以调用父类的eat方法实现不覆盖父类方法实现的情况下，自定义自己的方法实现。如果不调用父类的eat方法则父类的eat方法实现会被覆盖。
        super.eat()
        print("子类的eat方法")
    }
    
    // 如果你不想某个计算属性、存储属性、方法、构造器(构造方法)可以被子类重写，那么你可以在其之前加上final关键字，防止子类重写
//    final func tests() {
//
//    }
    func myFunction() {
        // 没加final关键字时在 下面的子类中输入myFunction有预选项能重写，加上后就无法重写了。
        print("dog function")
    }
    
    // 如果你想某个构造器(构造方法)必须被子类重写，那么你可以在其之前加上required关键字，子类不重写就会报错。
    // 注意。required关键字只能用在构造器上
//    required init(naaaame: String) {
//        self.breed = ""
//        super.init(name: naaaame)
//    }
    
    // deinit。万物有生成必然有消逝，deinit方法就是init构造器的对立。在这个类的实例被释放之前会调用。反构造
    deinit {
        
    }
    
}

class TianYuanDog: Dog {
    override func myFunction() {
        super.myFunction()          // 调用父类的myFunction，这样就不会覆盖父类的方法实现。也可以不调用，直接覆盖
        print("TianYuanDog function")
    }
}
let tyDog = TianYuanDog(name: "", breed: "")            // 自动继承了父类的指定构造器
tyDog.myFunction()          // 输出 dog function -> TianYuanDog function

