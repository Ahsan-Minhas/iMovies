//
//  UpcomingMoviesVM.swift
//  iMovies
//
//  Created by Mac on 02/04/2022.
//

import Foundation


protocol UpcomingMoviesDelegate{
    func DidGetMoviesData(response: UpcomingMoviesResponse)
    func DidFailedToGetData(failedResponse:RequestFailed)
}

struct UpcomingMoviesVM{
    var delegate: UpcomingMoviesDelegate?
    func getUpcomingMovies(request:UpcomingMoviesRequest){
        let UpcomingResource = UpcomingMoviesResorce()
        UpcomingResource.GetMoviesData() { result in
            if result != nil{
                delegate?.DidGetMoviesData(response: result!)
            }
        }
    }
}
