//
//  LearnSwfit
//  Created by Ht.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// 在Swift中String类型是值类型。如果创建新的String值，则在将String值传递给函数或方法时，或者将其赋值给常量或变量时，将复制该String值

/* 字符串的拼接 */
var str1 = "str1"
let str2 = "str2"
let _ = str1 + str2         // 可以直接使用 + 号进行拼接 (常用)
let _ = String(format: "%@%@", str1, str2)          // 也可以使用String的初始化方法提供的占位符的方式拼接
let _ = "字符串的拼接: \(str1)\(str2)"        // 也可以直接使用Swift中String的占位符语法拼接 (常用)
print(str1.append(str2))

/* 字符串的截取 */
let mp4Str = "tEst.mP4"
// Swift String提供了判断是否包含某前缀 or 后缀的方法
if mp4Str.hasPrefix("test") {
    print("包含test前缀")
} else {
    print("不包含test前缀")
}
// mp4Str.hasSuffix("mp4")      // 后缀
// mp4Str.contains(".")        // 该方法用于判断整个字符串中是否包含某个字符串

print("移除首字符: " + mp4Str.dropFirst())       // 该方法是返回新字符串value，并未改变原始的mp4Str
print("移除末尾字符: " + mp4Str.dropLast())

if let range = mp4Str.range(of: ".m") {
    print(mp4Str[..<range.lowerBound])      // 输出tEst
    print(mp4Str[range.upperBound...])      // 输出p4
    print(mp4Str.prefix(upTo: range.lowerBound))        // 输出tEst
    print(mp4Str.suffix(from: range.upperBound))        // 输出p4
    print("除去.m后: \(mp4Str.prefix(upTo: range.lowerBound))\(mp4Str.suffix(from: range.upperBound))")
} else {
    print("没有找到.m的位置")
}

/* Swift提供了将整个String转为大写 or 小写的方法。该方法是返回新字符串value，并未改变原始的mp4Str */
print("大写: " + mp4Str.uppercased())
print("小写: " + mp4Str.lowercased())

/* 字符串转data */
//let strData = mp4Str.data(using: String.Encoding(编码格式枚举))
let strData = mp4Str.data(using: .utf8)         // 上面的写法可简写为这种，Swift中枚举类型在使用时无需写枚举名，可以直接使用点语法即可

/* 字符串中的字符数量 */
let _ = mp4Str.count

/* Swift提供对现有的cocoa框架无缝访问，以及对Objective-C代码的混编和互操作性
    使用 as 关键字即可将Swift的类转换为对应的OC(一般以NS开头，如NSString，NSArray数组，NSDictionary字典等)类型，然后就可以使用OC类型的方法属性等
 */
let ocStr = mp4Str as NSString
print((mp4Str as NSString).length)         // OC中字符串的长度。
print(ocStr.substring(with: NSRange(location: 0, length: 3)))       // 截取从第0个字符开始，往后3个字符的字符串。这个比上面的Swift字符串截取要方便很多，所以在开发中也经常将Swift中的类型转为OC类型后使用，各取所长

let str = "string"

let intStr = "2"

let floatStr = "3.0"

let doubleStr = "5.492349"

// 字符串转Double、Int、Float，直接强制将String转换为想要的类型。
// 通俗一点说如果字符串是数字，那么可以直接转Double、Float、Int；
// 如果不是数字则转换失败。
print(Int(str) ?? 998)     // 输出998，转换失败，输出我们给的默认值
print(Int(intStr) ?? 666)   // 2
print(Float(floatStr) ?? 0.3) // 3.0
print(Double(doubleStr) ?? 0)  // 5.492349
