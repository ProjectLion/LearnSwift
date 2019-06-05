//
//  LearnSwfit
//  Created by Ht.
//  Copyright © 2019 Ht. All rights reserved.
//

import UIKit

// 在介绍枚举、类、结构体之前先介绍一下Swift中的几个权限关键字
// 从低到高分为五层:
// 1、private。被其修饰的属性、方法只能在本类中使用，访问。不包括拓展类
// 2、filePrivate。字面意思，文件私有。只能在当前文件(当前.swift文件)中访问、继承、重写，Swift中可以在同一个文件内创建多个class、struct、enum，所以把它放在private的上一级
// 3、internal。默认的访问级别(一般省略不写，因为默认就是它)。在整个模块中都可以被访问
// 4、public。可以在任何地方被访问，不能在其他module中被继承和重写
// 5、open。可以在任何地方被访问、继承、重写

// "module"解释: 一般的第三方库封装起来以后都是一个独立的module，这也是为什么在使用第三方库时全是使用的open关键字，而不是public。系统的库也是一个独立的module

// 用法: 一般放在需要修饰的方法、属性、enum、结构体、类关键字之前
// 类、方法和属性可以用filePrivate、private、internal、public、open修饰
// enum和结构体可以用filePrivate、private、internal、public修饰，不能用open修饰
