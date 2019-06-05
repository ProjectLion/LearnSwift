//
//  LearnSwfit
//  Created by Ht.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// Swift中的Switch语句可以匹配 Int、String、枚举、Double、Bool、区间、元组
// Switch语句中如果可以列出所有的可能性则不需要加default，否则都需要加上default。
// 如: 枚举。枚举只有三种情况时，Switch全部一一case出来就不需要加default
// 这个事情由Xcode来做
// 声明枚举
enum Test {
    case one, two, three
}
// 匹配枚举。tip: 枚举可以直接使用点语法访问
let test: Test = .one
switch test {           // 所有情况列举完了，不需要加default
case .one:
    // 所有的case条件下都必须有实现，若没有代码实现则加上break
    break
case .two:
    print("two")
case .three:
    break
}

/*********** 分割线 ***********/
// 匹配 Int 区间匹配
let int = 100
switch int {
case 0..<50:            // 开区间。0到50不包含50，只要符合该条件都执行case下的代码
    break
case 50..<101:
    print("符合")
    // Swift的Switch中是默认不贯穿的，也就是当符合某个条件时即执行条件下的代码，执行完毕便跳出Switch判断，即使没有加break。
    // 需要贯穿继续执行匹配的话可以在条件代码末尾加上 fallthrough 关键实现
    fallthrough
case 100...200:
    print("贯穿下来的")
case 200, 300, 400, 500:        // 也可以将匹配条件一一列出来
    break
default:
    break       // 由于case条件是Int型，不可能列举完，所以需要加上default
}

/*********** 分割线 ***********/
// 匹配String
let str = "hello"
switch str {
case "hello":
    print("hello")
case "world":
    break
default:
    break
}

/*********** 分割线 ***********/
// 匹配元组
let tuple = (10, 20)
switch tuple {
case (1, 2):
    break
case (10, let rith):
    // 可以使用let语法访问元组中的另一个值
    print("猜对一半，另一半是\(rith)，奖励50%")
    fallthrough
case (_, 20):
    // 在匹配元组时如果不想匹配其中的一个元素的话可以使用下划线_ 替代。这样的话就只会匹配后面的20
    print("猜对一半，奖励50%")
    fallthrough
case (10, 20):
    print("全部猜中了!翻倍奖励!")
default:
    break
}
