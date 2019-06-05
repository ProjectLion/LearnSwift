//
//  LearnSwfit
//  Created by Ht.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// while语句
var num = 5
while num > 0 {     // 只要num大于0就一直会执行while代码块中的代码
    print("执行")
    num -= 1
}
// 经典的死循环
//while 0 {
//    print("1")
//}

// Swift弃用了do while语句，相应的使用 repeat while 语句。
var num1 = 5
repeat {
    print("执行")
    num1 -= 1
} while num1 > 0

