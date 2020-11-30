//
//  Api.swift
//  Habesha
//
//  Created by Ali Sher on 12/11/2020.
//  Copyright © 2020 Ali Sher. All rights reserved.
//

import UIKit
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG


var sign = "sign"
var salt = "salt"

class Api: NSObject {
    
    private static func getRandomSalt()-> Int{
        
        let number = Int.random(in: 0...900)
        return number
    }
    
    private static func MD5(string: String) -> String {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        
        return digestData.base64EncodedString()
    }
    
    private static func md5Hash (str: String) -> String {
        if let strData = str.data(using: String.Encoding.utf8) {
            var digest = [UInt8](repeating: 0, count:Int(CC_MD5_DIGEST_LENGTH))
     
            strData.withUnsafeBytes {
                CC_MD5($0.baseAddress, UInt32(strData.count), &digest)
            }
     
     
            var md5String = ""
            for byte in digest {
                md5String += String(format:"%02x", UInt8(byte))
            }
     
            if md5String.uppercased() == "8D84E6C45CE9044CAE90C064997ACFF1" {
                print("Matching MD5 hash: 8D84E6C45CE9044CAE90C064997ACFF1")
            } else {
                print("MD5 hash does not match: \(md5String)")
            }
            return md5String
     
        }
        return ""
    }
     
    //let md5HashStr = md5Hash(str: str)
    //print(md5HashStr)
    
    
    public static func toBase64(str1: String, param1: String, param1Value: String) -> String {
        let apiKey = "viaviweb"

        salt = "537" //+ String(getRandomSalt())
        sign = md5Hash(str: apiKey + salt)//MD5(string: apiKey + salt)
        
        print(salt)
        print(sign)
        
         
        let dict  = ["salt":salt,
                           "sign":sign,
                           param1: param1Value,
                           "method_name":str1]
        
        
        
        var str = ""
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(dict) {
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                str = jsonString
            }
        }


        let utf8str = str.data(using: .utf8)
        var base64string = ""




        if let base64Encoded = utf8str?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0)) {
            print("Encoded: \(base64Encoded)")
            base64string = base64Encoded
            if let base64Decoded = Data(base64Encoded: base64Encoded, options: Data.Base64DecodingOptions(rawValue: 0))
            .map({ String(data: $0, encoding: .utf8) }) {
                // Convert back to a string
                print("Decoded: \(base64Decoded ?? "")")
            }
        }
        
        
        return base64string
    }
    
    
}
//eyJzYWx0IjoiNTM3Iiwic2lnbiI6IjRmNmRiOThmNDg5ZTkxM2NiMGJmZTRjNjk4ZDA3MjI3Iiwi
//bWV0aG9kX25hbWUiOiJnZXRfYXBwX2RldGFpbHMifQ==

extension Dictionary {
    var queryString: String {
        var output: String = ""
        for (key,value) in self {
            output +=  "\(key)=\(value)&"
        }
        output = String(output.dropLast())
        return output
    }
}

extension String {

    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }

    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }

}
