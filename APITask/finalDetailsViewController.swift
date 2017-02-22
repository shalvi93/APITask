//
//  finalDetailsViewController.swift
//  APITask
//
//  Created by Sierra 4 on 22/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit


class finalDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
   
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var passwordlbl: UILabel!
    
    @IBOutlet weak var phonelbl: UILabel!
    
    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var addresslbl: UILabel!
   
    @IBOutlet weak var countryLbl: UILabel!
    
    var  nameVar: String?
    var emailVar: String?
    var passwordVar: String?
    var phoneVar: String?
    var cityVar: String?
   var addressVar: String?
   var countryVar: String?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameLabel.text = nameVar
        emailLbl.text = emailVar
        passwordlbl.text = passwordVar
        phonelbl.text = phoneVar
        cityLbl.text = cityVar
        addresslbl.text = addressVar
        countryLbl.text = countryVar
        
    }

    
    
    
    
    
    
    
    
   

    

}
