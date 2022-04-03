//
//  UpcomingMoviesResource.swift
//  iMovies
//
//  Created by Mac on 02/04/2022.
//

import Foundation

struct UpcomingMoviesResorce{
    func GetMoviesData(completion : @escaping (_ result: UpcomingMoviesResponse?) -> Void)
    {
        let RequestUrl = URL(string: "\(ApiEndpoints_APIKey.UpcomingMovies)?api_key=\(ApiEndpoints_APIKey.Api_key)")
        let httpUtility = HttpUtility()
        
           
            httpUtility.postApiData(requestUrl: RequestUrl!, requestBody: nil, resultType: UpcomingMoviesResponse.self) { result in
                _ = completion(result)
        }
       
    }
}
