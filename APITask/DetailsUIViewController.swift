//
//  DetailsUIViewController.swift
//  APITask
//
//  Created by Sierra 4 on 21/02/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Alamofire
import ObjectMapper

class DetailsUIViewController: UIViewController {

    @IBOutlet weak var nameTxtF: SkyFloatingLabelTextField!
    
    @IBOutlet weak var emailTxtFild: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var passwordtxtF: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var phnNumbtxtF: SkyFloatingLabelTextField!
    
    @IBOutlet weak var cityTxtF: SkyFloatingLabelTextField!
    
    @IBOutlet weak var AddresstxtF: SkyFloatingLabelTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func forwardButton(_ sender: Any) {
        
        if (nameTxtF.text == "" )
        {
            let alert = UIAlertController(title: "Invalid", message: "please enter your name", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else if !validateUsername(str: nameTxtF.text!)
        {
            let alert = UIAlertController(title: "Invalid", message: "you have entered digits.please try again", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        }
            
            
        else if !isvalidEmail (YourEMailAddress: emailTxtFild.text!)
        {
            
            let alert = UIAlertController(title: "Invalid", message: "Please enter a valid email address", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        }
            
        else if (passwordtxtF.text == "")
        {
            let alert = UIAlertController(title: "Invalid", message: "password should be more than 5 digits", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)        }
            
        
        else if !PhoneNumbervalidate(digitsvalue: phnNumbtxtF.text!)
            
        {
            
            let alert = UIAlertController(title: "Invalid", message: "Phone number must be 10 digits", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else if
            (nameTxtF.text!.isEmpty || emailTxtFild.text!.isEmpty || phnNumbtxtF.text!.isEmpty || passwordtxtF.text!.isEmpty)
        {
            
            let alert = UIAlertController(title: "Sign up unscessful", message: "try again!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
            
        else
        {
            let name: String = nameTxtF.text!
            let alert = UIAlertController(title: "Hi", message: "\(name) you have successfully Logged In", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    
   
    func validateUsername(str: String) -> Bool
    {
        do
        {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z]", options: .caseInsensitive)
            if regex.matches(in: str, options: [], range: NSMakeRange(0, str.characters.count)).count > 0
            {
                return true
            }
        }
        catch {}
        return false
    }
    
    
    func isvalidEmail(YourEMailAddress: String) -> Bool {
        let REGEX: String
        REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluate(with: YourEMailAddress)
    }
    
    func PhoneNumbervalidate(digitsvalue: String) -> Bool {
        let PHONE_REGEX = "[0-9]{6,12}"
        // "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: digitsvalue)
        return result
    }


    
    @IBAction func Backbtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}