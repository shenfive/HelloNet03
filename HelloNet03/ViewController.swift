//
//  ViewController.swift
//  HelloNet03
//
//  Created by 申潤五 on 2019/12/7.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIModel.share.queryRandomUserAlamofire { (data, error) in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                do {
                    if let theData = data as? Data {
                        let json = try JSON(data: theData)
                        print(json)
                        let lastname  = json["results"][0]["name"]["first"].stringValue
                        print(lastname)
                        
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}

