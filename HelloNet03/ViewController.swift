//
//  ViewController.swift
//  HelloNet03
//
//  Created by 申潤五 on 2019/12/7.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUser()
    }
    
    func setView(data:JSON){
        let lastname  = data["results"][0]["name"]["first"].stringValue
        nameLabel.text = lastname
        let headerlink = data["results"][0]["picture"]["large"].stringValue
        headerImage.kf.setImage(with: URL(string: headerlink))
        let email = data["results"][0]["email"].stringValue
        emailLabel.text = email
        let phone = data["results"][0]["phone"].stringValue
        phoneLabel.text = phone
        
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

