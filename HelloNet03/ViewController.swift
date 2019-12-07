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
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUser()
    }
    
    func setView(data:JSON){
        let lastname  = data["results"][0]["name"]["first"].stringValue
        nameLabel.text = lastname
    }
    
    func updateUser(){
        APIModel.share.queryRandomUserAlamofire { (data, error) in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                do {
                    if let theData = data as? Data {
                        let json = try JSON(data: theData)
                        self.setView(data: json)
                        print(json)

                        
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    @IBAction func updateButton(_ sender: Any) {
        updateUser()
    }
    
}

