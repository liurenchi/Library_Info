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

var menudata:menuDara = menuDara(redr_info: "证件信息", book_lst: "当前借阅", book_hist: "借阅历史")


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource


{
    @IBOutlet weak var tableview: UITableView!

    
    
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "pushDetail"{
            if let indexPath = self.tableview.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as! DetailViewController
                destinationController.detailInfo = tableview.cellForRowAtIndexPath(indexPath)?.textLabel?.text
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
      
//        Alamofire.request(Router.GetBookInfo).responseString { (_, _, string, _) in
//            println(string)
//        }
   
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = menudata.redr_info
        case 1:
            cell.textLabel?.text = menudata.book_lst
        case 2:
            cell.textLabel?.text = menudata.book_hist
        default:
            cell.textLabel?.text = ""
 
        
        }
        
        
        return cell
    }
    
   
 
    @IBAction func close(segue:UIStoryboardSegue) {
        
        
    }
    

}
