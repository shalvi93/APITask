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
import NVActivityIndicatorView
import M13Checkbox


class  SignInViewController: UIViewController {
   
    @IBOutlet weak var checkBoxD: M13Checkbox!
    @IBOutlet weak var emailTxtOut: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTxtf: SkyFloatingLabelTextField!
       //var ckeckBox: String?
    var indicator:NVActivityIndicatorView?
    var name: String?
    var phone: String?
    var email: String?
    var password: String?
    var city: String?
    var country: String?
    var address: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        checkBoxD._IBBoxType = "Square" //checkbox
        checkBoxD.cornerRadius = 0
        checkBoxD.stateChangeAnimation = M13Checkbox.Animation(rawValue: "Fill")!
        
       
        emailTxtOut.selectedTitleColor = UIColor(red: 0.0 ,green: 0.71 ,blue: 0.95 , alpha: 1)
        emailTxtOut.lineHeight = 0
        emailTxtOut.selectedLineHeight = 0
        
       
       passwordTxtf.selectedTitleColor = UIColor(red: 0.0 ,green: 0.71 ,blue: 0.95 , alpha: 1)
        passwordTxtf.lineHeight = 0
        passwordTxtf.selectedLineHeight = 0
        
        
        if let login = UserDefaults.standard.value(forKey: "login") as? [String: String] {
           emailTxtOut.text = login["email"]
            passwordTxtf.text = login["password"]
            if !login.isEmpty
            {
                checkBoxD.setCheckState(M13Checkbox.CheckState(rawValue: "Checked")!, animated: true)
         indicator = NVActivityIndicatorView(frame:CGRect.init(x: self.view.center.x,y:self.view.center.y+100,width:40,height:40),type: .lineSpinFadeLoader,color: UIColor.gray, padding: 5)
     }
        }
    }
    func fetchData() {
        
        let param:[String:Any] = ["email" : emailTxtOut.text!, "password" :  passwordTxtf.text!, "flag":"1"]
        
        ApiHandler.fetchData(urlStr: "login", parameters: param) { (jsonData) in
            // print(jsonData)
            let userModel = Mapper<User>().map(JSONObject: jsonData)
            
            print(userModel?.msg ?? "")
            print(userModel?.profile?.username ?? "")
            print(userModel?.profile?.phone ?? "")
            self.name = userModel?.profile?.username
            self.email = userModel?.profile?.email
            self.password = userModel?.profile?.password
            self.city = userModel?.profile?.city
            self.country = userModel?.profile?.country
            self.address = userModel?.profile?.address
            self.performSegue(withIdentifier: "SegueTofinal", sender: self)
        self.hide()
            
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
                show()
                fetchData()
        }
 
       
        
        
        
       // nameLabel.text = passedData["name"] as! String?
        
        
        
        
        
        
    }

    func isvalidEmail(YourEMailAddress: String) -> Bool {
        let REGEX: String
        REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluate(with: YourEMailAddress)
    }
    
    
    
    
//    
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
//    {
//    
//       // guard let DestViewController : finalDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "SegueTofinal") as? finalDetailsViewController else { return }
//        DestViewController.nameVar = self.name
//        DestViewController.emailVar = self.email
//        de
//        
//        self.present(DestViewController, animated: true, completion: nil)
//       
//        
//    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "SegueTofinal"
        {
            let nextViewController = segue.destination as? finalDetailsViewController
                nextViewController?.nameVar = self.name
                nextViewController?.emailVar = self.email
                nextViewController?.phoneVar = self.phone
                nextViewController?.passwordVar = self.password
                nextViewController?.cityVar = self.city
                nextViewController?.countryVar = self.country
                nextViewController?.addressVar = self.address
                
 
               
        
        }
    }
    
    func show() {
        self.view.addSubview(indicator!)
        UIView.animate(withDuration: 0.2, animations: {
            UIApplication.shared.keyWindow?.addSubview(self.indicator!)
            self.indicator?.startAnimating()
        })
    }
    func hide() {
        indicator?.stopAnimating()
        UIView.animate(withDuration: 0.2, animations: {
            self.indicator?.removeFromSuperview()
            self.view.removeFromSuperview()
        })
    }
    
    
        
}

