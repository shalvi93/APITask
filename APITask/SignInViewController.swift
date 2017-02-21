//
//  ViewController.swift
//  APITask
//
//  Created by Sierra 4 on 21/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import Alamofire
import SkyFloatingLabelTextField
import ObjectMapper

class  SignInViewController: UIViewController {
   
    
    @IBOutlet weak var emailTxtOut: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTxtf: SkyFloatingLabelTextField!
  
        override func viewDidLoad() {
        super.viewDidLoad()
     }
    func fetchData() {
        
        let param:[String:Any] = ["email":"suvadeepdas91@gmail.com", "password":"qwerty", "flag":"1"]
        
        ApiHandler.fetchData(urlStr: "login", parameters: param) { (jsonData) in
            // print(jsonData)
            let userModel = Mapper<User>().map(JSONObject: jsonData)
            
            print(userModel?.msg ?? "")
            print(userModel?.profile?.username ?? "")
            print(userModel?.profile?.phone ?? "")
            
        }
    }
    

    @IBAction func SignUp(_ sender: Any)
    {
    }
    @IBAction func SignInBtn(_ sender: Any)
    {
        if (emailTxtOut.text == "" )
        {
            let alert = UIAlertController(title: "Invalid", message: "please enter your Email", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else if !isvalidEmail(YourEMailAddress: emailTxtOut.text!)
        {
            let alert = UIAlertController(title: "Invalid", message: "please try again", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        }
        else if (passwordTxtf.text == "")
        {
            let alert = UIAlertController(title: "Invalid", message: "password should be more than 5 digits", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
            else
            {
            
            let alert = UIAlertController(title: "Hi", message: " you have successfully Logged In", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
 
        fetchData()
        
    }

    func isvalidEmail(YourEMailAddress: String) -> Bool {
        let REGEX: String
        REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluate(with: YourEMailAddress)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

