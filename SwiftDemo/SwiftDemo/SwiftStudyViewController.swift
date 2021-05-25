//
//  SwiftStudyViewController.swift
//  SwiftDemo
//
//  Created by 丁浪平 on 2021/4/11.
//

import UIKit

class SwiftStudyViewController: UIViewController {
   
    var testData: Data!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        
        Swiftstudy4()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Swift 之  switch

    
    func swiftCode() -> Void {
//        1，闭区间运算符：a...b
//        2，半闭区间运算符：a..<b
//        3，字符串范围也可以使用区间运算符
//        for icount in 512...1024
        
        
        
        /*
        （1）更好用的switch...case，for循环，枚举，结构体
        a. switch...case
        不需要break，一个case可以写多个条件，使用fallthrough继续执行
         */
        let num = arc4random() % 10
        switch num {
        case 1, 2:
            print("1, 2")
        case 3..<5:
            print("3, 4")
        case ..<7:
            print("6")
        case ...8:
            print("8")
        default:
            print("defalut")
        }
    }
    
    // MARK: - Swift 之  结构体

    func Structfun() {
        //结构体在Swift中的地位很重要，Array Dictionary Set Int Float Double Bool String都是结构体
        
        /*
          什么时候用结构体，什么时候用类
          把结构体看做值
          位置（经纬度）坐标（二维坐标，三维坐标）温度
          把类看做是物体 人 车 动物
        
         */
        
         /*
           结构较小，适用于复制操作，相比一个class的实例被多次引用，struct更加安全
           无须担心内存泄漏或者多线程冲突问题
         */
        
        //与if语句相同的是， guard也是基于一个表达式的布尔值去判断一段代码是否该被执行。与if语句不同的是，guard只有在条件不满足的时候才会执行这段代码。你可以把guard近似的看做是Assert，但是你可以优雅的退出而非崩溃。
        struct Location {
            var long: Double
            var lat : Double
            
            init?(coordinateString: String){
                // 非常简洁的非空判断，安全可靠
                guard
//                    let commaIndex = coordinateString.index(of: ","),
                    let commaIndex = coordinateString.firstIndex(of: ","),
                            let firstElement = Double(coordinateString[coordinateString.startIndex..<commaIndex]),
                            let secondElement = Double(coordinateString[coordinateString.index(commaIndex, offsetBy: 1)..<coordinateString.endIndex])
                            else {
                                // 可能会失败的init return nil
                                return nil
                        }
                
                self.long = firstElement
                self.lat = secondElement
                
            }
            
            
        }
        
        
        
        
    }
    // MARK: - Swift 之  枚举

    func enmufun() {
        // Swift的枚举可以和整型，浮点数，字符串，布尔类型关联，不写默认关联字符串
        enum Language: String {
                case Swift
                case ObjectiveC = "Objective-C"
                case C
                case Java
            }
        print(Language.Swift.rawValue)
        Language.init(rawValue: "Swift")

        // 可以绑定值
        enum RequestResult {
            case Success(Int)
            case Error(String)
        }

        let requestResult = RequestResult.Success(1)
        switch requestResult {
        case .Success(let code):
            print(code)
        case .Error(let errorTint):
            print(errorTint)
        }

        // 可以定义方法和计算型属性
        enum Device {
            case iPad, iPhone, AppleTV, AppleWatch
            func introduced() -> String {
                switch self {
                case .iPad: return "iPad"
                case .iPhone: return "iPhone"
                case .AppleWatch: return "AppleWatch"
                case .AppleTV: return "AppleTV"
                }
            }
            
            var year: Int {
                switch self {
                case .iPhone: return 2007
                case .iPad: return 2010
                case .AppleTV: return 2011
                case .AppleWatch: return 2012
                }
            }
        }
        let introduce = Device.iPhone.introduced()
    }
    
    
    // MARK: - Swift 之  闭包
    func Swiftstudy4() -> Void {
        /*
        closure：Swift 中的 block
         闭包就是能够读取其他函数内部变量的函数，可以理解成定义在一个函数内部的函数。
                简单的说它就是一个代码块，用{}包起来，他可以用在其他函数的内部，将其他函数的变量作为代码块的参数传入代码块中，在Swift中多用于回调。这个跟Object-C中的block是一样的。

        
         实例
         // block
         void(^callback)(NSString *) = ^(NSString *str) {
             // code
         }


         
         //一般形式
         //有参有反
         let testOne: (String, String) -> String = {(str1, str2) in return str1 + str2}
         print(testOne("one", "two"))
         //无参有反  可以直接省略 "in"
         let testTwo: () -> String = {return "test闭包"}
         //无参无反
         let testThree: () -> Void = {print("test闭包")}
         
         上面的例子中:后面是闭包的类型，而=后面的就是一个代码块，也就是闭包的具体实现，这些个OC中的block基本一样。
         
         */
        
        
        let testOne: (String, String) -> String = {(str1, str2) in
            return str1 + str2
        }
        print(testOne("one", "two"))
        
        //起别名
        //可以用"typealias"先声明一个闭包类型
        typealias testBlock = (String) -> Void
        let aaa: testBlock = {str in
            print(str)
        }
        print(aaa("inj"))

    }
    
    // MARK: - Swift 之  函数
    func Swiftstudy3() -> Void {

        /*
        函数是一种特殊的闭包
         
         // 无参无返回值的三种写法
            func a() -> Void { ... }
            func a() -> () { ... }
            func a() { ... }  //最简


            // 有参数无返回值
            func square(a: Int, b: Int) -> Int { return a * b }
            // 有参数有返回值
            func square(a: Int, b: Int) { ... } //最简
         
         */
        /*
        外部参数及忽略
        1/提供外部参数能增强函数的可读性，同时也能够让函数在内部使用参数更加简单
        忽略外部参数用 “_” 表示
       
         // frist/second表示外部参数，a标识函数的内部参数只能够在函数的内部使用
        func sum(first a: Int, second b: Int) -> Int {
            return a + b
        }
        sum(first: 10, second: 20);

        // 忽略外部参数 “_”
        func sum(_ a: Int, _ b: Int) -> Int {
            return a + b
        }
        sum(10, 20);
         */
        
    }
    // MARK: - Swift 之 ？、！、as、as!、as?（看我这点就够）
    func Swiftstudy2() -> Void {
        /*
         
          ?的使用
          定义：用?修饰的常量或者变量，代表这是一个可选类型的常量或者变量，就是说这个量可以有值，也可以没有值。如下例子，如果num有值就是int类型，如果没有值那就是nil
          let num: Int?                        // nil类型
          let num: Int? = 2                    // int类型
        
         !的使用
         定义：如果要操作一个可选类型的变量，并且你需要进行强解包的时候，你就会用到!。如果有值就会得到变量的值，如果为nil那么程序就会crash
         例子：
           // 定义一个String的可选类型str，显示赋值，不会crash，正常。
           var str: String? = "皇晓晨"
           let message = "你好" + str!
           print(message)

           // 定义一个String的可选类型str，不进行显示赋值，会crash
           var str: String?
           let message = "你好" + str!
           print(message)
           Fatal error: Unexpectedly found nil while unwrapping an Optional value (致命错误:在展开可选值时意外发现nil)

         as的使用

         定义：有保证的转换，从派生类转换为基类的向上类型
        
         场景1:（从派生类转换为基类，向上转型）
           class Animal {}
           class Cat: Animal {}
           let cat = Cat {}
           let animal = cat as Animal

         场景2:（数值类型转换，消除二义性）
           let num1 = 10 as CGFlot
           let num2 = 10 as Int
           let num3 = (10 / 2) as Double
           
         场景3:（switch语句中进行模式匹配）
           switch animal {
             case let cat as Cat:
               print("如果是Cat类型对象，则做相应处理")
             case let dog as Dog:
               print("如果是Dog类型对象，则做相应处理")
             default: break
           }
         
         
         as!的使用
         定义：强制类型转换，向下转型时使用，如果转换失败会报runtime运行错误

         例子：
           class Animal {}
           class Cat: Animal {}
           let animal: Animal = Cat()
           let cat = animal as! Cat
         
         as?的使用
         定义：与as!操作符的转换规则完全一样，但是as?如果转换不成功的时候便会返回一个nil对象。成功的话返回可选类型值。由于as?在转换的时候也不会出现错误，
              所以对于如果能确保100%会成功的转换则可以使用as!，否则用as?

         例子：
           let animal: Animal = Cat()
           if let cat = animal as? Cat {
             print("转换成功～")
           } else {
             print("转换失败，是个nil")
           }
         */
    }
    
    
    
    
    // MARK: - 闭包
    func bibaofun() -> Void {
        
        //闭包表达式
        /*
        闭包表达式一般形式：
        {
            (参数列表) -> 返回值类型 in
            statements
        }
         */
        //1.闭包常用方式
        //在swift中，可以通过func定义一个函数，也可以通过闭包表达式定义一个函数。
        /*
        1.闭包语法
        {
        (参数列表) ->返回值类型 in 函数体代码
        }
        */
        
        

        var sumclose = {
            (a:Int , b:Int) -> Int in return a + b
        }

        sumclose(1, 2)
        
        //2.尾随闭包   尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。
        
        
        func someFunctionTrailingClosure(closure: () -> Void ){
             // 函数体部分
        }
        // 以下是【不使用】尾随闭包进行函数调用
        someFunctionTrailingClosure(closure: {
            // 闭包主体部分
        })

        // 以下是【使用】尾随闭包进行函数调用
        someFunctionTrailingClosure() {
          // 闭包主体部分
        }
        
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    func appStudyfun() -> Void {
        let v1 = LeoSwAppManager()
                
        //?? 被命名为空合运算符
        let username = AppDelegate.sharedAppDelegate().appName ?? "demo"
        //loginName 表示为可选性，如果loginName 为空，则使用默认名称 Guest
          
        //?? 被命名为空合运算符
       // let v2 = AppDelegate.sharedAppDelegate().testv1
       // print(v2 ?? 1)
    

        //SwiftNotice.swift 指示器的使用
        self.pleaseWait()
        self.noticeTop("OK!")
        self.noticeSuccess("Success!")
        self.noticeError("Error!")
        self.noticeInfo("Info")
        self.noticeOnlyText("Only Text")
        self.clearAllNotice() // clear

            
        
        //self.testJSONFile()
        //self.appbundleIdentifier()
        
        
        greet(V1: "name")
    }
    
    
    
    func testswiftoption1() -> Void {
        /*
        问号？
        a.声明时添加？，告诉编译器这个是Optional的，如果声明时没有手动初始化，就自动初始化为nil
        b.在对变量值操作前添加？，判断如果变量时nil，则不响应后面的方法。
        叹号！
        a.声明时添加！，告诉编译器这个是Optional的，并且之后对该变量操作的时候，都隐式的在操作前添加！
        b.在对变量操作前添加！，表示默认为非nil，直接解包进行处理
        
         
         
         Swift学习（四）---Optional
         
         一、Swift中可选项的出现

         为了解决OC中的nil问题

         OC中nil为无类型的指针
         OC中的数组、字典、集合都不能存放nil
         OC中所有变量都可以为nil
         OC只能用在对象上，而在其他地方比如NSNotFound只能表示值的缺失
         二、定义

         可选项的意思就是这个变量或者常量可能有值，也可能为空nil

         三、可选项的使用方式

         判断展开
         //展开调用可选项
         let strOptional: String? = "abc"
         if strOptional != nil {
             let count = strOptional!.count
             print(count)
         }
         绑定展开
         //绑定调用可选项
         let strOptional: String? = "abc"
         if let actualStr = strOptional {
             let count = actualStr.count
             print(count)
         }
         强制展开
         //强制展开，加个!号  强制展开不推荐使用，因为如果strOptional为nil，则程序会报错
         let strOptional: String? = "abc"
         let count = strOptional!.count
         隐式展开
         //隐式展开
         let strOptional: String! = "abc"
         let count = strOptional.count
         可选链的方式
         //可选链的方式
         let strOptional: String? = "abc"
         let count = strOptional?.count
         if count != nil {
             let lastIndex = count! - 1
             print(lastIndex)
         }
         */
    }
    
    
    
    // MARK: - Plyaer
    func initPlayerBasedOnReachability() {
        
        let reachability = Reachability()!
        
        reachability.whenReachable = { reachability in
        }
        reachability.whenUnreachable = { reachability in
            DispatchQueue.main.async {
                print("no network")
            }
        }
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    
    
    
    
    func greet(V1:String) -> Int {
        
        return 1;
    }
    
    
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        return (1,2)
    }
    
    
    
    
    
    
    
    
    
    func test10() -> Void {
        //For-In 循环

        //遍历数组
        let names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names {
            print("Hello, \(name)!")
        }
        // 数组遍历
        var array = [1,2,3,4]
        for item in array {
            
        }

        for (i, item) in array.enumerated() {
            
        }

        for item in array {
            array.append(item)
        }

        // 数组的函数式
        let mapArray = array.map { (item) -> Int in
            return item + 1
        }

        let filterArray = array.filter { (item) -> Bool in
            return item % 2 == 0
        }

        let reduce = array.reduce(3) { (item1, item2) -> Int in
            return item1 + item2
        }

        let sortArray = array.sorted { (item1, item2) -> Bool in
            return item1 > item2
        }

        // 数组的截取
        let index4 = 2
        let array4 = [1,2,3,4,5]
        let subArray4 = array4[0..<index4]

        // 字典遍历
        let dictionary = ["one": 1, "two": 2, "three": 3]
        for (key, value) in dictionary {
            print(key, value)
        }
        
        
        
        //遍历字典
        let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        for (animalName, legCount) in numberOfLegs {
            print("\(animalName)s have \(legCount) legs")
        }
        
        
        
        
        //While 循环
       // while 循环会一直运行一段语句直到条件变成 false。这类循环适合使用在第一次迭代前，迭代次数未知的情况下。Swift 提供两种 while 循环形式：

        //while 循环，每次在循环开始时计算条件是否符合；
        //repeat-while 循环，每次在循环结束时计算条件是否符合。
//        var square = 0
//        var diceRoll = 0
//        while square < finalSquare {
//            // 掷骰子
//            diceRoll += 1
//            if diceRoll == 7 { diceRoll = 1 }
//            // 根据点数移动
//            square += diceRoll
//            if square < board.count {
//                // 如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
//                square += board[square]
//            }
//        }
        print("Game over!")
        
        
        
//        Switch
//        switch 语句会尝试把某个值与若干个模式（pattern）进行匹配。根据第一个匹配成功的模式，switch 语句会执行对应的代码。当有可能的情况较多时，通常用 switch 语句替换 if 语句。
        let someCharacter: Character = "z"
        switch someCharacter {
        case "a","y":
            print("The first letter of the alphabet")
        case "z":
            print("The last letter of the alphabet")
        default:
            print("Some other character")
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    //集合类型  数组Array 集合Set 字典 Dictionary
    func  testArrayfun() -> Void {
        //数组
        var arr1 = [Int]()
        arr1.append(3)
        arr1 = []
        // threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]
        var threeDoubles = Array(repeating: 0.0, count: 3)
        var sixDoubles = 2 + 1
        // sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]


        //下面这个例子创建了一个叫做 shoppingList 并且存储 String 的数组：
        var shopList:[String] = ["leo", "huahua"]
        var shopList2:[Int] = [1, 2]
        shopList.count
        if shopList.isEmpty {
            print("empty")
        }
        shopList[0] = "newValue"
        //插入数据
        shopList.insert("zhu", at: 1)
        shopList.remove(at: 0);
        shopList.removeLast()
        
        
        //数组的遍历
        var booksList:[String] = ["leo", "huahua"]
        for item in booksList {
            print(item)
        }
        for (index, item) in booksList.enumerated(){
            print("index = \(index) itme= \(item)")
        }
        
        
        // MARK: - 集合（Sets）
    //集合用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。
        //创建和构造一个空的集合
        var letters = Set<Character>()
        letters.insert("a")
        letters = []
        
        var strSets:Set<String> = ["rook","look"]
        var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
        favoriteGenres.count
        if favoriteGenres.isEmpty {
            print("empty")
        } else {
            print(favoriteGenres.count)
        }
        if favoriteGenres.contains("look") {
            //包含
        }
        //遍历
        for gener in favoriteGenres{
            print(gener)
        }
        
        // MARK: - 字典
    //字典是一种无序的集合，它存储的是键值对之间的关系，其所有键的值需要是相同的类型，所有值的类型也需要相同。每个值（value）都关联唯一的键（key），键作为字典中这个值数据的标识符。和数组中的数据项不同，字典中的数据项并没有具体顺序。你在需要通过标识符（键）访问数据的时候使用字典，这种方法很大程度上和在现实世界中使用字典查字义的方法一样。

        var namesOfIntegers = [Int: String]()

        var airports : [String: String] = ["name":"leo"]
        var airports2 = ["name":"leo"]
        airports.isEmpty;
        
        var airports3 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

        if let oldValue = airports3.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue).")
        }
        // 输出“The old value for DUB was Dublin.”
        
        
        //遍历
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        
        //通过访问 keys 或者 values 属性，你也可以遍历字典的键或者值：
        for airpcode in airports.keys {
            print("\(airpcode)")
        }
        for airpvalue in airports.values {
                   print("\(airpvalue)")
        }
        //key 是否包含name
        if airports.keys.contains("name") {
            //
        }

    }
    
    //字符串类型
    func testStringfun() -> Int {
        var emptyStr = ""
        var String1 = String()
        
        if emptyStr.isEmpty {
            print("空的")
        }
        //你可以通过将一个特定字符串分配给一个变量来对其进行修改，或者分配给一个常量来保证其不会被修改：
        var s1 = "hello"
        s1 += "xiaohua"
        
        //let常量不会被修改
        let constantString = "Highlander"


       // 你可通过 for-in 循环来遍历字符串，获取字符串中每一个字符的值：
        for character in "Dog!" {
            print(character)
        }
        
        let string1 = "hello"
        let string2 = " there"
        var welcome = string1 + string2
        
        let exclamationMark: Character = "!"
        welcome.append(exclamationMark)


        
        
        return 1;
    }
    
    //基本数据类型
    func jichuleixing() -> Void {
       //元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。
      // http404Error 的类型是 (Int, String)，值是 (404, "Not Found")

        let http404Error = (404, "Not found")
       // 你可以将一个元组的内容分解（decompose）成单独的常量和变量，然后你就可以正常使用它们了：
        let (code, message) = http404Error
        print(code)
        print(message)
        print("code is \(code)")
        print("message is \(message)")
       // 此外，你还可以通过下标来访问元组中的单个元素，下标从零开始：
        print("The status code is \(http404Error.0)")
        //你可以在定义元组的时候给单个元素命名：
        let http200Status = (statusCode: 200, description: "OK")
        //给元组中的元素命名后，你可以通过名字来获取这些元素的值：
        print("The status code is \(http200Status.statusCode)")




        
        
    }
    
    //可选类型学习
    //使用可选类型（optionals）来处理值可能缺失的情况。可选类型表示两种可能： 或者有值， 你可以解析可选类型访问这个值， 或者根本没有值。
    func optionTest() -> Int {
        
        var serverCode: Int? = 404
        serverCode = nil
        //nil 不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。
        
        var answer:String?
        //你声明一个可选常量或者变量但是没有赋值 surveyAnswer 被自动设置为 nil

        //注意
        //Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中，nil 是一个指向不存在对象的指针。在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型。

    //当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值。这个惊叹号表示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析（forced unwrapping）：

        var convertedNumber: Int? = 123
        if convertedNumber != nil {
            print("convertedNumber has an integer value of \(convertedNumber!).")
        }
        // 输出“convertedNumber has an integer value of 123.”
        
        
        return 1;
    }
    
    
    
    //获取版本号
    func appVersion() -> String {
           guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String, let bundle = Bundle.main.infoDictionary?["CFBundleVersion"] as? String  else {
               return ""
           }
           return  "\(version):\(bundle)"
       }
    
    //获取版本号
    func appbundleIdentifier() {

        
        let infoDictionary = Bundle.main.infoDictionary
            
        let appDisplayName: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String //App 名称
        let bundleIdentifier:String = Bundle.main.bundleIdentifier! // Bundle Identifier
        let appVersion:String = Bundle.main.infoDictionary! ["CFBundleShortVersionString"] as! String// App 版本号
        let buildVersion : String = Bundle.main.infoDictionary! ["CFBundleVersion"] as! String //Bulid 版本号
        let iOSVersion:String = UIDevice.current.systemVersion //ios 版本
        let identifierNumber = UIDevice.current.identifierForVendor //设备 udid
        let systemName = UIDevice.current.systemName //设备名称
        let model = UIDevice.current.model // 设备型号
        let localizedModel = UIDevice.current.localizedModel  //设备区域化型号
        
        //(infoDictionary);
        print(appDisplayName);
        print(bundleIdentifier);
        print(appVersion);
        print(buildVersion);

        
        
       }
    
    
    
    func testJSONFile() {
        let jsondata = self.getConfiguration(resource: "Tests")
        print(jsondata)

        
        //如何使用SwiftyJSON
        let jsonObject = JSON(jsondata)
        print(jsonObject)
        
        
        
        let nameOfFirstObject1 = jsonObject[0]["name"].string //This will return the name as a string
        let nameOfFirstObject2 = jsonObject[0]["name"].double //This will return null
        
        print(nameOfFirstObject1)
        print(nameOfFirstObject2)

    }

    
    
    /// 获取配置信息
    ///
    /// - Parameter resource: 资源文件名
    /// - Returns: content
    func getConfiguration(resource: String) -> Any {
        if let path = Bundle.main.path(forResource: resource, ofType: "json") {
            do {
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                //data转成数组
                
                
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                
                
                return jsonResult
            } catch {
                // maybe lets throw error here
                return []
            }
        }
        return []
    }
    
    
    
    
    
    
    
    // MARK: - 结构体
    func teststruct() {
        struct Resolution {
            var width = 0
            var height = 0
        }
        
        let someResolution = Resolution()
        let vga = Resolution(width: 640, height: 480)

        
        
    }
    
    // MARK: - 枚举
    func meiju() {
        enum Grade: String {
            case perfect = "A"
            case great = "B"
            case good = "C"
        }
        let grade = Grade.good
        print(grade)
        print(grade.rawValue)
        print(Grade.perfect.rawValue)
        
        
        //结合switch
        switch grade {
        
        case .perfect:
            print("A")
        case .great:
            print("B")
        default:
            print("---")
        }
        
        
        enum CompassPoint {
            case north
            case south
            case east
            case west
        }
        
        enum Planet {
            case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
        //遍历枚举的case
        //对于某些枚举，收集所有该枚举的cases很有用。 您可以通过在枚举名称后输入：CaseIterable来启用此功能。 Swift将所有案例的集合作为枚举类型的allCases属性公开。 这是一个例子：
        enum Beverage: CaseIterable {
            case coffee, tea, juice
        }
        let numberOfChoices = Beverage.allCases.count
        print("\(numberOfChoices) beverages available")
        // Prints "3 beverages available"
        //在上面的示例中，您编写Beverage.allCases来访问包含所有Beverage枚举案例的集合。 您可以像使用其他集合一样使用allCases-该集合的元素是枚举类型的实例，因此在这种情况下，它们是“Beverage”值。 上面的示例计算了有多少个case，下面的示例使用for循环遍历所有案例。
        for beverage in Beverage.allCases {
            print(beverage)
        }
        // coffee
        // tea
        // juice
       

    }
    
    
    
    // MARK: - 函数
    //
    
    //隐式返回: 函数体是单一表达式，函数可以隐式返回这个表达式
    func sumfunc(v1: Int, v2: Int) -> Int {
        v1 + v2
    }
    //返回元组:实现多返回值
    func calculate(v1: Int, v2: Int) -> (sum: Int, dif: Int, avg: Int) {
        let sum = v1 + v2
        return (sum, v1 - v2, sum >> 1)
    }
    
    func test1(v1: Int) -> Int {
        return 2;
    }
    //参数标签     goToWork(at: "08:00")
    func goToWork(at time: String) {
        
    }
    //参数标签     goToWorks("08:00")
    func goToWorks(_ time: String) {
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    //默认参数值
    //与c++不同 c++ 只能从最右往左设置默认参数
    //swift 通过参数标签去匹配参数，当存在默认参数且为省略参数标签时，非默认参数不能省略标签
    
    func testCheck(){
        check(name: "jack", age: 2)
        check(age: 20)
        check(name: "rose", age: 10, job: "tech")
    }
    
    func check(name: String = "sb", age: Int, job: String = "none") {
        
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
