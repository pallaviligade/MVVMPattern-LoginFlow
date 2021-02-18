//
//  HttpUtility.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 10/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import Foundation

struct  HttpUtility{
    
    func getPostData<T:Decodable>(RequestUrl:URL,PostBody:Data,ResultType:T.Type,ComplicationHandler:@escaping(_ result:T?) -> Void) {
        
        var requestURL = URLRequest(url: RequestUrl)
        requestURL.httpBody = PostBody
        requestURL.httpMethod = "Post"
        requestURL.addValue("application/json", forHTTPHeaderField: "content-type")
        
        
        URLSession.shared.dataTask(with: requestURL) { (Data, HttpResponse, error) in
            if error == nil && HttpResponse != nil
            {
                let decoder = JSONDecoder ()
                do {
                    let result = try decoder.decode(T.self, from: Data!)
                    ComplicationHandler(result)
                } catch  {
                    debugPrint(error.localizedDescription)
                }
            }
        }.resume ()
    }

    func getApiData<T:Decodable>(RequestUrl:URL, ResultType:T.Type, ComplicationHandler:@escaping(_ Result:T?) -> Void)
    {
        
        URLSession.shared.dataTask(with: RequestUrl) { (ResponseData, httpResponse, Error) in
            
            if (Error == nil && ResponseData != nil){
            let decoder = JSONDecoder ()
                
                do {
                    let result = try decoder.decode(T.self, from: ResponseData!)
                    ComplicationHandler(result)
                } catch  {
                    debugPrint(error)
                }
                
            }
            
            
        }.resume()
        
    }
    
}
