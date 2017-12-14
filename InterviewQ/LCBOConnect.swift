//
//  LCBOConnect.swift
//  InterviewQ
//
//  Created by Yaxin Yuan on 2017-12-14.
//  Copyright © 2017 Yaxin Yuan. All rights reserved.
//

import Foundation
import Alamofire



class LCBOConnect{
    
    static let baseURL = "https://www.lcboapi.com/"
    
    class func getListofStores(completion: @escaping ([(String, String)]) -> Void){
        let urlString = baseURL + "stores?access_key=\(API.key)&page=1"
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
//        urlRequest.setValue("Token " + API.key, forHTTPHeaderField: "Authorization")
        urlRequest = try! URLEncoding.default.encode(urlRequest, with: nil)
        
        Alamofire.request(urlRequest).responseJSON(completionHandler: { response in
            print("response is \(response)")
            if let dict = response.result.value as? NSDictionary{
                if let results = dict["result"] as? [NSDictionary]{
                    var addressList: [(String, String)] = []
                    for result in results{
                        let latitudeStr = String(describing: result["latitude"] as! NSNumber)
                        let longitudeStr = String(describing: result["longitude"] as! NSNumber)
                        
                        addressList.append((latitudeStr, longitudeStr))
                    }
                    completion(addressList)
                }
            }
        })
        
   
        
        
    }
}
