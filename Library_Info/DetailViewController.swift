//
//  DetailViewController.swift
//  Library_Info
//
//  Created by  Lrcray on 15/4/3.
//  Copyright (c) 2015年  Lrcray. All rights reserved.
//

import UIKit
import Alamofire
class DetailViewController: UIViewController
{
    var detailInfo:String?
    
 
    @IBOutlet weak var outPut: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let Info = detailInfo{
            switch Info{
            case "借阅历史" :
                Alamofire.request(Router.GetBookHistory).responseString (encoding: NSUTF8StringEncoding, completionHandler:{ (_, _, string, _) in
                    
                    println(string)
                    
                   // self.outPut.text = string
            })
                
                
            default:
               // println("暂未添加功能")
                Alamofire.request(.GET, "http://coin.lib.scuec.edu.cn/reader/redr_verify.php")
                    .responseString(encoding: NSUTF8StringEncoding, completionHandler: { (_, _, string, _) -> Void in
                        println(string)
                    })
                
            }
        }
     
        
                
        }
    
        
        
     
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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


