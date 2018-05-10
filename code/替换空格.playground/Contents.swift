//: Playground - noun: a place where people can play



//import Foundation


//func replaceBlank(in aString: String) -> String {
//
//    let aChar: String = "%20"
//
    // (1) associated Foundation
//    return aString.replacingOccurrences(of: " ", with: aChar, options: .literal, range: nil)
    
    
    // (2)
//    var newString = ""
//    for i in aString.enumerated() {
//        if i.element == " " {
//            newString.append(String(aChar))
//        } else {
//            newString.append(String(i.element))
//        }
//    }
//    return newString
//
//
//    return ""
//
//}


func replaceBlank(in aString: String, length: Int) -> String {
    
    var blankCount = 0  // 空格数量
    for char in aString.enumerated() {
        if char.element == " " {
            blankCount += 1
        }
    }
    
    if blankCount == 0 { return aString } // 无空格直接返回原数据
    
    let targetLength = aString.count + 2 * blankCount  // 转化后长度增长 空格*2
    
    var l = length - 1  // 原始最后下标
    var t = targetLength - 1  // 目标最后下标
    var chars = Array<Character>(repeating: "_", count: targetLength)  // 新建一个大小为 targeLength 大小的字符数组
    
    while l >= 0 {  // 遍历 l，依次填充数据大小为 t 的数组
        let start = aString.index(aString.startIndex, offsetBy: l)
        let end = aString.index(aString.startIndex, offsetBy: l + 1)
        let char = Character(String(aString[start..<end]))

        if char == " " {  // 检查每个原始数据位置是否为空
            chars[t-2...t] = ["%", "2","0"]
            t -= 2
        } else {
            chars[t] = char
        }
        
        l -= 1
        t -= 1
    }
    
    return String(chars)
}


// MARK: - Test

let aString = "I Love Programing"
let a = replaceBlank(in: aString, length: aString.count)




// MARK: - Test

//replaceBlank(in: "I Love Code")

