//
//  LearnSwfit
//  Created by Ht.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// 简单的for循环
for i in 0..<10 {           // 开区间，不包含10
    print(i)
}
for j in 1...10 {            // 闭区间。包含10.输出1到10
    print(j)
}


// 使用for循环遍历数组元素
let arr = ["1", "2", "3", "4", "5"]
// 写法一: for i in <#集合#> {}。i为数组中的元素下标
for i in 0..<arr.count {        // 数组不能越界，所以使用开区间。
    print(arr[i])
}
// 上面这个写法就很像C语言的
// for int i = 0, i++, i < arr.count {
//
// }

// 写法二: 依然是for i in <#集合#> {}。Swift中废除了类似C的for循环写法，只保留了for i in 的写法
for item in arr {           // 这个写法直接列出了数组中的元素。而不是下标
    print(item)
}

// for循环遍历字典。
let dict = ["1": 4, "2": 5, "3": 6, "4": 7]
for item in dict {              // 字典也可以直接遍历获取其中的元素
    print(item)
}

for key in dict.keys {          // 也可以遍历keys属性，从而通过key去访问字典
    print(dict[key])
}

for value in dict.values {          // 遍历字典的所有value
    print(value)
}

// 在集合类中说过String在严格意义上也是集合类，来遍历一下String
let str = "abcdefg"
for subStr in str {
    print(subStr)
}
