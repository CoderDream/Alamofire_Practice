//
//  AppDelegate.swift
//  Alamofire_Practice
//
//  Created by CoderDream on 2018/11/12.
//  Copyright © 2018 CoderDream. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //re
        //        Alamofire.request("http://www.httpbin.org/net", parameters: ["name":"Kevin","age":18], encoding: .URL, headers: nil).responseJSON{
        //            if let v = $0.result.value {
        //                debugPrint(v)
        //            } else {
        //                debugPrint($0.result.error)
        //            }
        //        }
        //        let parameters: Parameters = ["foo": "bar"]
        //
        //        // All three of these calls are equivalent
        //        Alamofire.request("https://httpbin.org/get", parameters: parameters) // encoding defaults to `URLEncoding.default`
        //        Alamofire.request("https://httpbin.org/get", parameters: parameters, encoding: URLEncoding.default)
        //        Alamofire.request("https://httpbin.org/get", parameters: parameters, encoding: URLEncoding(destination: .methodDependent))
        demo6()
        return true
    }
    
    func demo1() {
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    func demo2() {
        //        let parameters: Parameters = ["foo": "bar"]
        let parameters: Parameters = ["name": "Keven", "age":18]
        Alamofire.request("https://httpbin.org/get", parameters: parameters).responseJSON { //response in
            //            print("Request: \(String(describing: response.request))")   // original url request
            //            print("Response: \(String(describing: response.response))") // http url response
            //            print("Result: \(response.result)")                         // response serialization result
            //
            //            if let json = response.result.value {
            //                print("JSON: \(json)") // serialized json response
            //            }
            //
            //            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
            //                print("Data: \(utf8Text)") // original server data as UTF8 string
            //            }
            if let v = $0.result.value {
                debugPrint(v)
            } else {
                debugPrint($0.result.error)
            }
            
        }
    }
    
    func demo3() {
        let parameters: Parameters = ["name": "Keven", "age":18]
        Alamofire.request("https://httpbin.org/get", parameters: parameters).responseJSON {
            if let v = $0.result.value {
                debugPrint(v)
            } else {
                debugPrint($0.result.error)
            }
            
        }
    }
    
    func demo4() {
        let parameters: Parameters = ["name": "Keven", "age":18]
        Alamofire.request("https://httpbin.org/get", parameters: parameters).responseJSON {
            if let v = $0.result.value {
                // debugPrint(v)
                if let dic = v as? [String: AnyObject] {
                    if let subDic = dic["args"] as? [String: AnyObject] {
                        if let name = subDic["name"] as? String {
                            debugPrint(name)
                        }
                    }
                }
            } else {
                debugPrint($0.result.error)
            }
            
        }
    }
    
    func demo5() {
        let parameters: Parameters = ["name": "Keven", "age":18]
        Alamofire.request("https://httpbin.org/get", parameters: parameters).responseJSON {
            if let v = $0.result.value {
                let json = JSON(v)
                debugPrint(json["args"]["name"].stringValue)
            } else {
                debugPrint($0.result.error)
            }
            
        }
    }
    
    func demo6() {
        let parameters: Parameters = ["name": "Keven", "age":18]
        Alamofire.request("https://httpbin.org/get", parameters: parameters).responseJSON {
            if let v = $0.result.value {                
                let json = JSON(v)
                let name = json["args"]["name"].stringValue
                print("name: \(name)")
            } else {
                debugPrint($0.result.error)
            }
            
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

