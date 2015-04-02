//
//  ViewController.swift
//  Library_Info
//
//  Created by  Lrcray on 15/4/3.
//  Copyright (c) 2015年  Lrcray. All rights reserved.
//

import UIKit
import Alamofire
 let libraryURLString = "http://coin.lib.scuec.edu.cn/reader/redr_verify.php"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
       
//        Alamofire.request(Router.LoginUser(["number":"11084017", "passwd":"91103710", "select":"cert_no"])).responseString { (_, _, string, _) in
//           // println(string)
//        }.response{ (request, response, data, error) in
//                
//        var mycookie = NSHTTPCookieStorage.sharedHTTPCookieStorage().cookies
//        var cookie:NSHTTPCookie!
//        for cookie in mycookie as [NSHTTPCookie]{
//            
//            }
//            
//             
//               
//                
//                
//                
//                
//                // var cookies = response.valueForHTTPHeaderField("Cookie")
//                //println(response)
//                  //println(request
//               // println(cookies)
//                
//                
//        }
       

        
        
        
        Alamofire.request(Router.GetBookInfo).responseString { (_, _, string, _) in
            println(string)
        }

        
        
        
        
        
        
        
        
        
        
        
        
    }

    

}
