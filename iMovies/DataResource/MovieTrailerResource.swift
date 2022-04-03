//
//  MovieTrailerResource.swift
//  iMovies
//
//  Created by Mac on 03/04/2022.
//

import Foundation



struct MovieTrailerResource{
    
    func GetTrailers(request: TrailerListRequest,completion : @escaping (_ result: TrailerListResponse?) -> Void)
    {
        let RequestUrl = URL(string: "\(ApiEndpoints_APIKey.MoviesBaseUrl)\(request.MovieID)/videos?api_key=\(request.ApiKey)")
        let httpUtility = HttpUtility()
        
           
            httpUtility.getApiData(requestUrl: RequestUrl!, resultType: TrailerListResponse.self) { result in
                _ = completion(result)
        }
       
    }
}
