//
//  LearnSwfit
//  Created by Ht.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// 枚举，枚举名一般大写开头，遵循驼峰命名
// case 一般小写开头
// Swift中的枚举在不设置值的情况下系统默认分配值，也可以指定值
enum Position {
    case left
    case right
    case top
    case bottom
}
// 也可以写作:
enum Position1 {
    case left, right, top, bottom
}
// Swift的枚举可以是String、Int、Double、Float、Bool类型的，而OC就只能是Int型
// String类型的枚举
enum Card: String {
    case red = "♥️"
    case black = "♠️"
}
// 在声明枚举类型的常量 or 变量时先指定其类型后可以直接使用点语法赋值
let card: Card = .red
// 也可以这么声明
let card1 = Card.red
// 使用 rawValue 属性来取值
print(card.rawValue)            // 红桃
// 也可以使用rawValue来构造一个枚举实例，eg:
// 构造一个Card实例。这里有个问题，它构造出来带着问好?，说明有可能你传入的rawValue不存在于它的case条件中。
let cardEnum = Card(rawValue: "♣️")
print(cardEnum!.rawValue)           // 输出 nil

// Int类型的枚举
enum Num: Int {       // Int型枚举在不设置值时系统默认分配从0开始
    case zero               // 0
    case one                // 1
    case two                // 2
}

// 手动分配值
enum Price: Int {
    case clothes = 998
    case shoes = 1998
    case hat = 98
    case socks = 2998
}
let shoes = Price.shoes
print(shoes.rawValue)           // 1998

/*********** 分割线 ***********/
// 在使用枚举时可直接使用点语法选择自己需要的case
// eg:
func enumTest(price: Price) {
    switch price {
    case .clothes:
        print("衣服\(price.rawValue)元")
    case .shoes:
        print("鞋子\(price.rawValue)元")
    case .socks:
        print("袜子\(price.rawValue)元")
    case .hat:
        print("帽子\(price.rawValue)元")
    }
}
enumTest(price: .shoes)         // 鞋子1998元
// 有很多从OC转Swift的人喜欢这么写
enumTest(price: Price.shoes)        // 这不符合Swift简洁的语法，不建议这么写。当然这么写也没错

/*********** 分割线 ***********/
// Swift中的枚举可以嵌套
// eg:
enum China {
    enum Yunnan {
        enum Kunming: String {
            case wuhua = "五华区"
            case panlong = "盘龙区"
            case gaoxin = "高新区"
            case guandu = "官渡区"
            case xishan = "西山区"
        }
    }
    enum Sichuan {
        enum Chengdu: String {
            case jinjiang = "锦江"
        }
    }
}
print(China.Yunnan.Kunming.wuhua.rawValue)          // 五华区

/*********** 分割线 ***********/
// 枚举关联值，利用枚举来传值
enum Code {         // 这里模拟构造一个网络请求的完成情况
    case success(data: Dictionary<String, Int>, state: Int)
    case fail(error: String, state: Int)
}
// 模拟一个网络请求
func request(complet: @escaping (Code) -> Void) {
    DispatchQueue.global().async {      // 在global队列中异步提交一个任务
        print("网络请求")
        let sta = true
        var code: Code
        if sta {        // 请求成功
            code = .success(data: ["price": 998], state: 0)
        } else {
            code = .fail(error: "请求失败", state: 1)
        }
        DispatchQueue.main.async {
            complet(code)
        }
    }
}

request { (code) in
    switch code {
    case .success(data: let dict, state: let sta):
        print("请求成功: \(dict)")
    case .fail(error: let err, state: let sta):
        print("请求失败: \(err)")
    }
}

/*********** 分割线 ***********/
// 可以在枚举中定义 方法和属性
enum Animal {
    case dog, cat, pig, tiger
    
    // 上面的动物都有一个动作，吃 (这是实例方法，必须通过实例对象进行调用)
    func eat(food: String) {
        switch self {
        case .cat:
            print("猫吃\(food)")
        case .dog:
            print("狗吃\(food)")
        case .pig:
            print("猪吃\(food)")
        case .tiger:
            print("老虎吃\(food)")
        }
    }
    
    // 枚举不能声明存储型属性，只能声明计算型属性。在类Class的介绍中可查看两者的介绍。
    // 上面的动物都有年龄
    var age: Int {
        switch self {           //
        case .dog:
            return 15
        case .tiger:
            return 10
        case .pig:
            return 1
        case .cat:
            return 12
        }
    }
}
// 猫的年龄
print(Animal.cat.age)
// 先实例化一个Animal对象
let animal = Animal.dog
animal.eat(food: "🦴")
