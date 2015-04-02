//
//  getLibraryData.swift
//  Library_Info
//
//  Created by  Lrcray on 15/4/3.
//  Copyright (c) 2015年  Lrcray. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static let libraryURLString = "http://coin.lib.scuec.edu.cn/reader/redr_verify.php"
    static let readerBookURLString = "http://coin.lib.scuec.edu.cn/reader/book_lst.php"
    static var OAuthToken: String?
    
    case LoginUser([String: AnyObject])
    case GetBookInfo
    case UpdateUser(String, [String: AnyObject])
    case DestroyUser(String)
    
    var method: Alamofire.Method {
        switch self {
        case .LoginUser:
            return .POST
        case .GetBookInfo:
            return .GET
        case .UpdateUser:
            return .PUT
        case .DestroyUser:
            return .DELETE
        }
    }
    
    var URLPATH: String {
        switch self {
        case .LoginUser:
            return Router.libraryURLString
        case .GetBookInfo:
            return Router.readerBookURLString
        case .UpdateUser(let username, _):
            return "/users/\(username)"
        case .DestroyUser(let username):
            return "/users/\(username)"
        }
    }
    
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSURLRequest {
        
        let URL = NSURL(string: URLPATH)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL)
        mutableURLRequest.HTTPMethod = method.rawValue
        
        
        mutableURLRequest.setValue("PHPSESSID=57eo0d8orfr1t5skrvim8em1b1", forHTTPHeaderField: "Cookie")

        switch self {
        case .LoginUser(let parameters):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        case .UpdateUser(_, let parameters):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
}












