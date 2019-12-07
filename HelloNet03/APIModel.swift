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
    private var apiURL = "https://randomuser.me/api/"
    private init(){}
    
    
    func queryRandomUserAlamofire(completion:@escaping(_ Data:Any?,_ respError: Error?)->())->(){
        
    }
    

}


