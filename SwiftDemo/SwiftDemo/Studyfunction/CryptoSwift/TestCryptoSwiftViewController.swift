//
//  TestCryptoSwiftViewController.swift
//  SwiftDemo
//
//  Created by love_ping891122 on 2021/5/24.
//

import UIKit
import CryptoSwift
class TestCryptoSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    
    
    
    
    
 

}
//第三方加密库CryptoSwift使用详解2（数据类型转换、MD5、SHA）
extension TestCryptoSwiftViewController{
    
    
    
    
    //MARK:----散列/哈希算法

    //1，计算 MD5 值
    func test11(){
        /*** 计算字节数组的MD5值 ***/
        let bytes:Array<UInt8> = [0x01, 0x02, 0x03]
        //方式一
        let digest1 = bytes.md5().toHexString() //5289df737df57326fcdd22597afb1fac
        //方式二
        let digest2 = Digest.md5(bytes).toHexString() //5289df737df57326fcdd22597afb1fac
         
        /*** 计算Data的MD5值 ***/
        let data = Data(bytes: [0x01, 0x02, 0x03])
        let digest3 = data.md5().toHexString() //5289df737df57326fcdd22597afb1fac
         
        /*** 计算字符串的MD5值 ***/
        let digest4 = "hangge.com".md5() //7c19a729eb62e03fcf1a8b4abbf591ed
        
    }
    
    //也可以通过 update 接口拼接多个字节数组一起计算。比如下面两种方式的计算结果是一样的。
    func test12(){
        //方式一
        print("hangge.com".md5()) //7c19a729eb62e03fcf1a8b4abbf591ed
         
        //方式二
        do {
            var digest = MD5()
            let partial1 = try digest.update(withBytes: "hangge".bytes)
            let partial2 = try digest.update(withBytes: ".com".bytes)
            let result = try digest.finish()
            print(result.toHexString()) //7c19a729eb62e03fcf1a8b4abbf591ed
        } catch { }
    }
    
    
    
    
    
    
    //MARK:----计算 SHA 值
    //1，下面是计算各种类型数据的 SHA 值。
    func test31(){
        /*** 计算字节数组的SHA值 ***/
        let bytes:Array<UInt8> = [0x01, 0x02, 0x03]
        //方式一
        let digest1 = bytes.sha1().toHexString() //7037807198c22a7d2b0807371d763779a84fdfcf
        let digest2 = bytes.sha224().toHexString()
        let digest3 = bytes.sha256().toHexString()
        let digest4 = bytes.sha384().toHexString()
        let digest5 = bytes.sha512().toHexString()
        //方式二
        let digest6 = Digest.sha1(bytes).toHexString() //7037807198c22a7d2b0807371d763779a84fdfcf
        let digest7 = Digest.sha224(bytes).toHexString()
        let digest8 = Digest.sha256(bytes).toHexString()
        let digest9 = Digest.sha384(bytes).toHexString()
        let digest10 = Digest.sha512(bytes).toHexString()
         
        /*** 计算Data的SHA值 ***/
        let data = Data(bytes: [0x01, 0x02, 0x03])
        let digest11 = data.sha1().toHexString() //7037807198c22a7d2b0807371d763779a84fdfcf
        let digest12 = data.sha224().toHexString()
        let digest13 = data.sha256().toHexString()
        let digest14 = data.sha384().toHexString()
        let digest15 = data.sha512().toHexString()
         
        /*** 计算字符串的SHA值 ***/
        let digest16 = "hangge.com".sha1() //87590e9784b527b23048aaa2e8af5eeecb0b8885
        let digest17 = "hangge.com".sha224()
        let digest18 = "hangge.com".sha256()
        let digest19 = "hangge.com".sha384()
        let digest20 = "hangge.com".sha512()
    }
    //也可以通过 update 接口拼接多个字节数组一起计算。比如下面两种方式的计算结果是一样的。
    func test32(){
        //方式一
        print("hangge.com".sha1()) //87590e9784b527b23048aaa2e8af5eeecb0b8885
         
        //方式二
        do {
            var digest = SHA1()
            let partial1 = try digest.update(withBytes: "hangge".bytes)
            let partial2 = try digest.update(withBytes: ".com".bytes)
            let result = try digest.finish()
            print(result.toHexString()) //87590e9784b527b23048aaa2e8af5eeecb0b8885
        } catch { }
    }

    
    
    
    
    
    
    
    
    
    
    
    //MARK:----常用的数据类型转换
    
    //1，Data 与字节数组（bytes）间的转换
    func test1(){
        //bytes转Data
        let data = Data(bytes: [0x01, 0x02, 0x03])
         
        //Data转bytes
        let bytes = data.bytes
    }
    
    //2，十六进制编码
    func test2(){
        //使用十六进制编码的形式建立字节数组
        let bytes = Array<UInt8>(hex: "0x010203")  // [1,2,3]
         
        //将字节数组转换为对应的十六进制编码
        let hex = bytes.toHexString()  // "010203"
    }
    //3，使用字符串生成字节数组
    func test3(){
        let bytes: Array<UInt8> = "password".bytes

    }
    //4，字节数组的 base64 转换
    func test4(){
        //字节数组的base64编码
        let bytes:[UInt8] = [1, 2, 3]
        let base64String1 = bytes.toBase64() //AQID
         
        //字符串的base64编码
        let string = "hangge.com"
        let base64String2 = string.bytes.toBase64() //aGFuZ2dlLmNvbQ==
    }
    
    
    
}

//第三方加密库CryptoSwift使用详解2（CRC、MAC、PBKDF2）
extension TestCryptoSwiftViewController{
    
    
    //MARK:----散列/哈希算法

    //CRC 校验码计算
    /**
     CRC 即循环冗余校验码（Cyclic Redundancy Check）：是数据通信领域中最常用的一种查错校验码，其特征是信息字段和校验字段的长度可以任意选定。
     循环冗余检查（CRC）是一种数据传输检错功能，对数据进行多项式计算，并将得到的结果附在帧的后面，接收设备也执行类似的算法，以保证数据传输的正确性和完整性。

     */
    func testC01(){
        /*** 计算字节数组的CRC值 ***/
        let bytes:Array<UInt8> = [0x01, 0x02, 0x03]
        let crc1 = bytes.crc16() //41232
        let crc2 = bytes.crc32() //1438416925
         
        /*** 计算Data的CRC值 ***/
        let data = Data(bytes: [0x01, 0x02, 0x03])
        let crc3 = data.crc16() //2 bytes
        let crc4 = data.crc32() //2 bytes
         
        /*** 计算字符串的CRC值 ***/
        let crc5 = "hangge.com".crc16() //90e7
        let crc6 = "hangge.com".crc32() //7eeb79d1
    }
    
    //消息认证码（MAC）计算
    /*
     消息认证码是指在密码学中，通信实体双方使用的一种验证机制，保证消息数据完整性的一种工具。
     其构造方法由 M.Bellare 提出，安全性依赖于 Hash 函数，故也称带密钥的 Hash 函数。
     消息认证码是基于密钥和消息摘要所获得的一个值，可用于数据源发认证和完整性校验。
     */
    
    //HMAC_SHA1 计算的样例。
    func testC02(){
        let str = "欢迎访问hangge.com"
        let key = "hangge"
        let hmac = try! HMAC(key: key.bytes, variant: .sha1).authenticate(str.bytes)
         
        print("原始字符串：\(str)")
        print("key：\(key)")
        print("HMAC运算结果：\(hmac.toHexString())")
        
        
        //）除了 SHA1，我们还可以使用其它算法比如 MD5，SHA256 等

        try! HMAC(key: key.bytes, variant: .md5).authenticate(str.bytes)
        try! HMAC(key: key.bytes, variant: .sha1).authenticate(str.bytes)
        try! HMAC(key: key.bytes, variant: .sha256).authenticate(str.bytes)
        try! HMAC(key: key.bytes, variant: .sha384).authenticate(str.bytes)
        try! HMAC(key: key.bytes, variant: .sha512).authenticate(str.bytes)
    
    }
    //Poly1305
    /*Poly1305 是 Daniel.J.Bernstein 创建的消息认证码，可用于检测消息的完整性和验证消息的真实性，现常在网络安全协议（SSL/TLS）中与 salsa20 或 ChaCha20 流密码结合使用。
     Poly1305 消息认证码的输入为 32 字节（256bit）的密钥和任意长度的消息比特流，经过一系列计算生成 16 字节（128bit）的摘要。
     */
    
    //使用一个字符串来生成一个 32 字节的密钥。
    func testC03(){
        let str = "欢迎访问hangge.com"
        let key = "hg012345678901234567890123456789"
        let mac = try! Poly1305(key: key.bytes).authenticate(str.bytes)
         
        print("原始字符串：\(str)")
        print("key：\(key)")
        print("Poly1305运算结果：\(mac.toHexString())")
    
    }
    
}


//第三方加密库CryptoSwift使用详解（AES加密与解密）
extension TestCryptoSwiftViewController{
    
}
