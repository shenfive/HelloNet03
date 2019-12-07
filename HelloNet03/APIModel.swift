//
//  APIModel.swift
//  HelloNet03
//
//  Created by 申潤五 on 2019/12/7.
//  Copyright © 2019 申潤五. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class APIModel {
    static var share = APIModel()
    private var apiURL = "https://randomuser.me/"
    private init(){}
   
    
    func queryRandomUserAlamofire(completion:@escaping(_ Data:Any?,_ respError: Error?)->())->(){
        let url = apiURL + "api/"
        let parameters:Parameters? = nil
        DispatchQueue.global().async {
            Alamofire.request(url,
                              method: .get,
                              parameters: parameters,
                              encoding: URLEncoding.default,
                              headers: nil).responseJSON { (response) in
                                DispatchQueue.main.async {
                                    switch response.result{
                                    case .success(_):
                                        return completion(response.data,nil)
                                    case .failure(let error):
                                        return completion(nil,error)
                                    }
                                }
            }
          
        }
    }

}


