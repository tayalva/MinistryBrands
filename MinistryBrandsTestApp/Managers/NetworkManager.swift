//
//  NetworkManager.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/20/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    static let shared = NetworkManager()
    
    let kAccessToken = "C3l__DVM9r5vQ2QFS6ZYINO5EHTRIFdKZTih"
    let mainAPIURL = "https://gorest.co.in/public-api/users?"
    
      func performAPICall(method: HTTPMethod, completion: @escaping (PersonResult?, Error?) -> Void) {
        
        let parameters: Parameters = ["_format": "json", "access-token": NetworkManager.shared.kAccessToken]
        
        Alamofire.request(mainAPIURL, method: method, parameters: parameters).responseJSON { response in
            
            if response.result.isSuccess {
                print("✅ response successful")
                let decoder = JSONDecoder()
                if let result = try? decoder.decode(PersonResult?.self, from: response.data!) {
                    completion(result, nil)
                } else {
                    print("❌ decode unsuccessful for person")
                    completion(nil, response.error)
                }
            } else {
                print("❌ response unsuccessful for person")
                completion(nil, response.error)
            }
        }
    }
}


