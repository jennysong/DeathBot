//
//  RESTClient.swift
//  DeathBot
//
//  Created by Shawn Jung on 2015-02-23.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import UIKit
import Foundation


class RESTClient {
    class func get (url: String, data: NSDictionary? = nil, headers: NSDictionary? = nil, var before: ((NSMutableURLRequest) -> Void)? = nil, var complete: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil, var success: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil, var error: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil) {
        self.defineDefaultHandlers(&before, &complete, &success, &error);
        var task = prepareTask("GET", url: url, headers: headers, data: data, before: before!, complete: complete!, success: success!, error: error!)
        
        task.resume()
    }
    
    class func post (url: String, data: NSDictionary? = nil, headers: NSDictionary? = nil, var before: ((NSMutableURLRequest) -> Void)? = nil, var complete: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil, var success: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil, var error: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil) {
        self.defineDefaultHandlers(&before, &complete, &success, &error);
        var task = prepareTask("POST", url: url, headers: headers, data: data, before: before!, complete: complete!, success: success!, error: error!)
        
        task.resume()
    }
    
    class func put (url: String, data: NSDictionary? = nil, headers: NSDictionary? = nil, var before: ((NSMutableURLRequest) -> Void)? = nil, var complete: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil, var success: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil, var error: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil) {
        self.defineDefaultHandlers(&before, &complete, &success, &error);
        var task = prepareTask("PUT", url: url, headers: headers, data: data, before: before!, complete: complete!, success: success!, error: error!)
        
        task.resume()
    }
    
    class func delete (url: String, data: NSDictionary? = nil, headers: NSDictionary? = nil, var before: ((NSMutableURLRequest) -> Void)? = nil, var complete: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil, var success: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil, var error: ((AnyObject, NSHTTPURLResponse) -> Void)? = nil) {
        self.defineDefaultHandlers(&before, &complete, &success, &error);
        var task = prepareTask("DELETE", url: url, headers: headers, data: data, before: before!, complete: complete!, success: success!, error: error!)
        
        task.resume()
    }
    
    private class func prepareTask (method: String, url: String, headers: NSDictionary?, data: NSDictionary? = nil, before: ((NSMutableURLRequest) -> Void), complete: ((AnyObject, NSHTTPURLResponse) -> Void), success: ((AnyObject, NSHTTPURLResponse) -> Void), error: ((AnyObject, NSHTTPURLResponse) -> Void)) -> NSURLSessionTask {
        
        var url     = NSURL(string: url)
        var request = NSMutableURLRequest(URL: url!)
        
        request.HTTPMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // convert header dictionary as request value
        if headers != nil {
            for (name, value) in headers! {
                request.addValue(value as? String, forHTTPHeaderField: name as String)
            }
        }
        
        // convert data dictionary as request body
        if data != nil {
            var body_err: NSError?
            if method == "GET" {
                // TODO: Implement for converting dictionary to url string for get request
            } else {
                request.HTTPBody = NSJSONSerialization.dataWithJSONObject(data! as NSDictionary, options: nil, error: &body_err)
            }
            
        }
        
        // Run before callback before start request task
        before(request)
        
        return NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {rawData, response, responseError in
            var responseDataErr: NSError?
            var httpResponse: NSHTTPURLResponse = response as NSHTTPURLResponse
            var responseData: AnyObject? = NSJSONSerialization.JSONObjectWithData(rawData, options: .MutableLeaves, error: &responseDataErr)
            
            // Run complete callback
            complete(responseData!, httpResponse)
            
            if responseError == nil && httpResponse.statusCode <= 400 {
                // Run succss callback
                success(responseData!, httpResponse)
            } else {
                // Run error callback
                error(responseData!, httpResponse)
            }
            
            }
        )
        
    }
    
    private class func defineDefaultHandlers(inout before: ((NSMutableURLRequest) -> Void)?, inout _ complete: ((AnyObject, NSHTTPURLResponse) -> Void)?, inout _ success: ((AnyObject, NSHTTPURLResponse) -> Void)?, inout _ error: ((AnyObject, NSHTTPURLResponse) -> Void)?) {
        before   = before == nil ?   self.defaultHandler.before : before
        complete = complete == nil ? self.defaultHandler.complete : complete
        success  = success == nil ?  self.defaultHandler.success : success
        error    = error == nil ?    self.defaultHandler.error : error
    }
    
    private class defaultHandler {
        class func before (request:NSMutableURLRequest) {
            // Implement some action to run before start request
            // like show loading modal
        }
        class func complete (data:AnyObject, response:NSHTTPURLResponse) {
            // Implement some action to run before start request
            // like hide loading modal
        }
        class func error (data:AnyObject, response:NSHTTPURLResponse) {
            // Implement some action to run before start request
            // like show error message alert view
            switch response.statusCode {
            case 422:
                println("Invalid Data");
            case 403:
                println("Wrong session token");
            case 401:
                println("ID or Password is invalid")
            default:
                println("Invalid Data");
                
            }
        }
        class func success (data:AnyObject, response:NSHTTPURLResponse) {
            // placeholder for success callback
        }
    }
}