//
//  Purse.swift
//  sampleImage
//
//  Created by 松山友也 on 2017/12/08.
//  Copyright © 2017年 Tomoya Matsuyama. All rights reserved.
//

import Foundation
import Alamofire

class Purse {
    static func postBook(){
        var parameters: [String:String] = ["name":"サンプル", "isbn":"1111", "author":"国際", "lesson":"コンネト", "money":"111"]
        var jsonData: Data = Data()
        do {
            jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        }catch{
            print("error")
        }
        
        let URL = "http://localhost:3000/books.json"
        let image: UIImage = UIImage(named: "sample.jpg")!
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(UIImageJPEGRepresentation(image, 0.5)!, withName: "image1", fileName: "sanple.jpg", mimeType: "image/jpeg")
            multipartFormData.append(jsonData, withName: "book")
//            multipartFormData.append(parameters)
        }, to:URL)
        { (result) in
            
            switch result {
                
            case .success(let upload, _, _):
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                upload.responseJSON { response in
                    print(response.request)
                    print(response.response)
                    print(response.data)
                    print(response.result)
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
                }
                
            case .failure(let encodingError):
                print(encodingError)
            }
        }
    }
}

//let arg = "{\"name\":\"サンプル\", \"isbn\":\"1111\", \"author\": \"国際\", \"lesson\":\"コンネト\", \"money\":\"111\"}"
//        guard let url = URL(string: "http://localhost:3000/books.json") else { return }
//        guard let authUrl = URL(string: "http://localhost:3000/users/sign_in.json") else { return }

//        guard let image: UIImage = UIImage(named: "sample.jpg") else { return }
//        guard let imageData: NSData = NSData(data:UIImageJPEGRepresentation(image, 1.0)!) else { return }
//
//        let url = NSURL(string: "http://localhost:3000/books.json")
//        var urlRequest_img : NSMutableURLRequest = NSMutableURLRequest()
//
//        if let u = url{
//            urlRequest_img.url = u as URL
//            urlRequest_img.httpMethod = "POST"
//            urlRequest_img.timeoutInterval = 30.0
//        }
//
//        let params = ["name":"サンプル", "isbn":"1111", "author":"国際", "lesson":"コンネト", "money":"111"]
//        let uniqueId = ProcessInfo.processInfo.globallyUniqueString
//        var body: NSMutableData = NSMutableData()
//        var postData :String = String()
//        var boundary:String = "---------------------------\(uniqueId)"
//
//        urlRequest_img.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        postData += "--\(boundary)\r\n"
//        postData += "Content-Disposition: form-data; name=\"book\"\r\n"
//        postData += "\r\n\(params)\r\n"
//        postData += "--\(boundary)\r\n"
//        postData += "Content-Disposition: form-data; name=\"image1\"; filename=\"name\"\r\n"
//        postData += "Content-Type: image/jpeg\r\n\r\n"
//        print(postData)
//        body.append(postData.data(using: String.Encoding.utf8)!)
//        print(postData.data(using: String.Encoding.utf8)!)
//        body.append(imageData as Data)
//
//        postData = String()
//        postData += "\r\n"
//        postData += "\r\n--\(boundary)--\r\n"
//
//        body.append(postData.data(using: String.Encoding.utf8)!)
//
//        urlRequest_img.httpBody = NSData(data:body as Data) as Data
//
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//
//        let task_img: URLSessionDataTask = session.dataTask(with: urlRequest_img as URLRequest, completionHandler: { data, request, error in
//
//            let anyObj: AnyObject!
//            do {
//                if(data != nil){
//                    anyObj = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions(rawValue: 0)) as AnyObject
//                }else{
//                    anyObj = nil
//                }
//
//            } catch _ as NSError {
//                anyObj = nil
//            }
//        })
//
//        task_img.resume()




