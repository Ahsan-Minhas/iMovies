//
//  HttpUtility.swift
//  MVVM
//
//  Created by Mac on 01/03/2022.
//

import Foundation

struct HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                let decoder = JSONDecoder()
                do {
                  
                    let result = try decoder.decode(T.self, from: responseData!)
                    print(result)
                    _=completionHandler(result)
                }
                catch let decodingError{
                    do {
                    let response = try JSONDecoder().decode(RequestFailed.self, from: responseData!)
                        COMMON_ALERT.showAlert(msg: response.statusMessage)
                    }
                    catch let error {
                        debugPrint(error)
                    }
                    debugPrint(decodingError)
                }
            }
           // print(responseData)

        }.resume()
    }

    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data?, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in

            if(data != nil && data?.count != 0)
            {
                do {
                    let response = try JSONDecoder().decode(T.self, from: data!)
                    _=completionHandler(response)
                }
                catch let decodingError {
                    do {
                    let response = try JSONDecoder().decode(RequestFailed.self, from: data!)
                        COMMON_ALERT.showAlert(msg: response.statusMessage)
                    }
                    catch let error {
                        debugPrint(error)
                    }
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }
}
