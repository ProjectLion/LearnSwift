//
//  LearnSwfit
//  Created by Ht.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// 闭包。闭包又可以看作是一个函数体，它像函数一样可以传参，可以有返回值。只是声明方式和调用方式跟函数func不同。
// 无参、无返回值:
var closure1: () -> Void = {
    
}

// 无参、有返回值:
var closure2: () -> String = {
    return "closure2"
}
// 可简写为:        // 当闭包中只包含一句 return 代码时，可以省略return关键字
closure2 = { "closure2" }
print(closure2())       // 输出 "closure2"

// 有参、有返回值的写法一:
//var closure3: (_ pram1: String, _ pram2: Int) -> String
// 参数名可以省略不写，一定要写参数名的话要在参数名前加下划线
var closure3: (String, Int) -> String
closure3 = {            // 类型自动推导。所以pram 对应String，pram1对应 Int
    pram1, pram2 in
    if pram2 == 1 {
        return "\(pram1) ht"
    } else {
        return "\(pram1) other"
    }
}
// 调用
closure3("I am", 1)         // "I am ht"
// closure3的写法二:
closure3 = {
    // $美元符加数字可用在闭包中，根据下标自动推导为闭包中相应的参数。从0开始一一对应
    if $1 == 1 {
        return "\($0) ht"
    } else {
        return "\($0) other"
    }
}
closure3("I am", 0)
// 写法三:
// 当闭包中只包含一句 return 代码时，可以省略return关键字
closure3 = { $1 == 1 ? "\($0) ht" : "\($0) other" }
closure3("I am", 0)
// 计算两个整数的乘积
var testClos: (Int, Int) -> Int = { return $0 * $1 }
testClos(2, 5)          // 10
testClos = { $0 * $1 }          // 这是闭包最简洁的写法。使用$符捕获参数、省略掉return
testClos(3, 5)          // 15

/*********** 分割线 ***********/
// 闭包能够从上下文中捕获变量、常量，从而用在自身的作用域中。
// eg:
var num = 1
let changeNumClosure = {
    num += 1
}
changeNumClosure()
print("改变后的num: \(num)")

/*********** 分割线 ***********/
// 使用闭包作为函数参数。注意()的范围，别看懵了
func closureTest(num: Int, closure: (String, Int) -> String) -> String {
    return closure("I am", num)
}
// 传入之前定义好的闭包
closureTest(num: 1, closure: closure3)   // I am ht
//closureTest(num: 1) { (<#String#>, <#Int#>) -> String in
//    <#code#>
////}
// 自定义闭包内部的实现。下面👇是自定义闭包实现的简化写法。
// 当闭包作为函数的最后一个参数时，可以将闭包后置到函数体外部，也可以放在函数体内部。这也叫做尾随闭包
closureTest(num: 1, closure: { $1 == 0 ? "I am ht" : "I am other" })    // I am other
closureTest(num: 1) { $1 == 0 ? "I am ht" : "I am other" }   // I am other

/*********** 分割线 ***********/
// 上面说到尾随闭包。下面为大家介绍逃逸闭包: 逃逸闭包、非逃逸闭包
// 在Swift 3.0以后，将闭包传递到函数中时，系统会将其默认为非逃逸闭包@noescape
// 逃逸闭包要在闭包前加上@escaping 关键字

// 非逃逸闭包的生命周期与函数相同: 1、闭包作为参数传入函数，2、函数中调用闭包，3、函数退出，闭包声明周期结束
// 逃逸闭包的生命周期比函数长，也就是说该闭包会“逃逸”出函数的作用域，所以即使退出了函数它依然能被执行调用。: 1、闭包作为参数传入函数，2、函数退出，3、闭包被调用，声明周期结束
// 上面的closureTest中的closure闭包参数属于非逃逸闭包, 即函数退出，闭包生命周期结束
// 逃逸闭包，eg:  如果不加@escaping关键字会编译出错
func escapingClos(closure:@escaping (Int) -> Int) {
    DispatchQueue.global().async {      // 在global队列中异步提交一个任务
        DispatchQueue.main.async {     // 在主线程中队列中异步提交一个任务
            print(closure(1))
        }
    }
}
escapingClos(closure: { $0 })

/*********** 分割线 ***********/
// 经常使用逃逸闭包的场景有:
// 1、在线程队列中异步调用闭包，比如网络请求成功 or 失败的回调。这个队列会持有闭包的引用，直到请求成功 or 失败
// 2、存储闭包作为属性、全局变量作稍后使用。eg:
var arr: [(String) -> Void] = []
func escapingBlock(closure: @escaping (String) -> Void) {
    arr.append(closure)     // 将闭包存储到arr属性中，用于逃逸调用
}
escapingBlock(closure: { print($0) })
escapingBlock(closure: { print("\($0) world") })
// 遍历装有闭包的数组，即使escapingBlock已经执行完成，我们依然可以在此处调用刚才传入的两个闭包
for clos in arr {
    clos("hello")
}
