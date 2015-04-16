//
//  LoginViewController.swift
//  Library_Info
//
//  Created by  Lrcray on 15/4/3.
//  Copyright (c) 2015年  Lrcray. All rights reserved.
//

import UIKit
import Alamofire
class LoginViewController: UIViewController
{
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    
    
    
    
    @IBAction func loginButton() {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(Username.text, forKey: "Username")
        defaults.setObject(Password.text, forKey: "Password")
       
        

        
        let username:String = defaults.stringForKey("Username")!
        let password:String = defaults.stringForKey("Password")!
        
        defaults.setObject(nil, forKey: "Cookie_name")
        defaults.setObject(nil, forKey: "Cookie_value")
        defaults.synchronize()
        Alamofire.request(Router.LoginUser(["number":"11084017", "passwd":"91103710", "select":"cert_no"])).responseString { (_, _, string, _) in
//             println(string)
            }.response{ (request, response, data, error) in
                
               
                var mycookie = NSHTTPCookieStorage.sharedHTTPCookieStorage().cookies
                var cookie:NSHTTPCookie!
           
                for cookie in mycookie as! [NSHTTPCookie]{
                    let defaults = NSUserDefaults.standardUserDefaults()
                    
                    defaults.setObject(cookie.name, forKey: "Cookie_name")
                    defaults.setObject(cookie.value, forKey: "Cookie_value")
                    defaults.synchronize()
                    println("COOKIES")
                    println(cookie.value)
                
                
                }
        }
        
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        
        
        

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
