//
//  ModelFunc.swift
//  VersionAction
//
//  Created by Hanzala Raza on 09/07/2021.
//

import Foundation


//func SignUp(email:String ,password:String  , Name:String , IsMale:Int, completionHandler:@escaping (_ success:SuccessModel?,Error?) -> ()){
//    
//
//        
//        let param : [String:Any] = [
//            Api.Params.Name :Name ,
//            Api.Params.Email : email ,
//            Api.Params.Password : password ,
//            Api.Params.IsMale :IsMale
//        ]
//    manager.request(Api.CONSTANTS_METHODS.SIGNUP_API, method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//            switch response.result {
//            case .success(let validResponse):
//                guard let res = validResponse as? [String:Any] else {return}
//                let data = try! JSONSerialization.data(withJSONObject: validResponse.self, options: [])
//                let resultObject = try! JSONDecoder().decode(SuccessModel.self, from: data)
//                completionHandler(resultObject,nil)
//            case .failure(let error):
//                switch (response.response?.statusCode) {
//                case 404:
//                    print("not Found")
//                case 401:
//                    print("unauthorized")
//                case 408:
//                    print("request timeout")
//                case 406:
//                    print("Unable to format response according to Accept header")
//                completionHandler(nil,error)
//                default:
//                print("Failed")
//                }
//            }
//        }
//}
