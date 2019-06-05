//
//  LearnSwfit
//  Created by Ht.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// if语句
let str = "hello"
if !(str == "hello") {          // 等价于str != "hello"，此处只是为了展示运算符 ! 的用法
    print("hello")
}
let b = false
if b {
    print("条件成立")
}

// if语句的延伸
// if let 语句常用于可空类型数据解析 或 向下转换类型
//
//if let <#constant name#> = <#optional#> {
//    <#statements#>
//}
let optionalStr: String? = "hello world"
if let str = optionalStr {          // 如果optionalStr有值，则将值赋给str常量。这样做可以保证程序不会崩溃。
    print(str)
} else {        // 如果为空则执行下面的语句
    print("optionalStr为nil")
}

// if let 语句的延伸
//guard let <#constant#> = <#expression#> else { return <#return value#> }
// guard let 语句的用法类似 if let
// eg:
func test(str: String?) {
    guard let str1 = optionalStr else {
        print("optionalStr为nil，没有值，将直接return")
        return
    }
    // 如果optionalStr有值，则将值赋给str1常量。
    // 跟 if let语句所不同的是:
    // 如果optionalStr没有值则直接return，可以顺带返回值出去，不会继续执行后面的代码
    print("解析过数据了。\(str1)")
}
func test1(str: String?) -> String {
    guard let value = str else { return "没有值" }       // 如果参数 str 为nil，则返回 "没有值"
    return "有值\(value)"
}
test(str: optionalStr)
print(test1(str: nil))


