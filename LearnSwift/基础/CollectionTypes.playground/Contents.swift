//
//  LearnSwfit
//  Created by Ht.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// Swift中的的集合类型有 Array(数组)、Dictionary(字典)、String(严格意义上讲String也属于集合类型)

/* 数组Array */
// Swift中以下几种方式都是正确的数组定义方式
var arr1 = ["a", "b", "c"]          // 类型推断，该数组为: [String]
let arr2: [Int] = [1, 2, 3]      // 显式声明类型，前面声明数组里装的类型后，等号后面就必须是装什么类型的数据。该数组为: [Int]
var arr3: Array<String> = ["1", "2", "3"]       // 显式声明类型，该数组为: Array<String>。等价于 [String]
var arr4: [Any] = []         // 在Swift的数组中可以是不同类型的数据，该数组为: [Any]。Any为任意类型，取出值后用 as! 关键字转换类型
arr4.append("1")        // 在数组中添加字符串 "1"
arr4.append(2)          // 在数组中添加整数 2
print(arr4)                 // 输出 ["1", 2]

// Swift中数组可用下标进行值访问(可能会存在越界)。语法为 arr[index]
// as关键字分为: as、as!、as?
// as: 1、从派生类转换为基类，向上转型。2、消除二义性。3、在Switch语句中进行对象的类型检测。
// as!: 强制解析，向下转型。解析Optional类型的数据时如果能确保100%有值且能转换成功才使用，否则会出现runtime崩溃。
// as?: as?与上面两种都不同，使用as?进行数据解析 or 转型即使失败也会返回nil，不会发生崩溃。所以开发中不确定的情况下都用as?解析数据 or 转换类型。
let num = arr4[1] as! Int        // 这里我确定数组中的第二个有值并且是整型，所以用as!
arr1[0] = "aa"      // 修改第0个元素的值为aa
print(arr1)

// 以下的用法跟String类型相似
print(arr1.count)           // 数组中的元素个数
print(arr1.dropFirst())     // 移除第一个元素
print(arr1.dropLast())      // 移除最后一个元素
print(arr1 + arr3)          // 合并两个数组
print(arr1[0..<2])          // "0..<2"的意思是0、1 开区间，不包含2。"0...2"的意思是0、1、2，闭区间，包含2

// Swift的数组可以跟OC的NSArray无缝转换
(arr1 as NSArray).addingObjects(from: ["d", "e"])

/* 字典Dictionary */
// Dictionary是一个以成对的键值对(Key: Value)组成的集合，默认情况下Swift中的所有基本类型(String, Int, Bool, Double)均可以用作字典的键(Key)。在实际开发中一般使用String作为Key
var doubleDict = [0.1: "0.1"]            // Double作为Key
var stringDict = ["stringKey": 2]        // String作为Key
var intDict = [2: true]               // Int作为Key
var boolDict = [false: "false"]        // Bool作为Key

// 字典支持使用下标语法访问特定的值，当所访问的键所对应的值不存在时返回nil，eg:
// 取值
doubleDict[0.2]         // nil
doubleDict[0.1]         // "0.1"
stringDict["stringKey"]     // 2
intDict[1]      // nil
boolDict[false]     // "false"
// 赋值，如果所访问的键有值则修改，反之则创建
doubleDict[0.1] = "0.11"        // 存在。修改为0.11
doubleDict[0.2] = "0.22"                // 不存在。自动新建一个key为0.2，value为0.22的键值对
print(doubleDict)

// 数组和字典的遍历放到了控制流中去说，因为Swift的for循环可以单独说一说
// 可通过keys or values属性获取字典的键值对数量
doubleDict.keys.count
doubleDict.values.count
doubleDict.removeValue(forKey: 0.2)        // 移除字典中key对应的键值对，如果key对应的value不存在则返回nil。
doubleDict.isEmpty      // 判断字典使用为空
print("移除0.2后： \(doubleDict)")


// Swift中还有一个集合类型叫做 元组。元组中包含了两个值，该值可以是任意类型。元组可以用在Switch语句中。语法如下:
// var tuple = (str: "1", int: 1)       // 元组的定义。str 和 int为元素名称。
// var tuple: (String, Int) = ()        // 也可以指定元组的元素类型。
var tuple = ("1", 1)                      // 也可以省略元素的名称和元素类型不写。自动类型推导，元素名称默认使用0、1(从左往右)表示
// 取值 直接使用点语法
print(tuple.0)
// 赋值
tuple.1 = 4
print(tuple)
