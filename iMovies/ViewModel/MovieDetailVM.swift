//
//  MovieDetailVM.swift
//  iMovies
//
//  Created by Mac on 03/04/2022.
//

import Foundation

protocol MovieDetailDelegate{
    func DidGetTrailerlist(response:TrailerListResponse)
    func DidFailedToGetTrailer()
}


struct MovieDetailVM{
    var delegate: MovieDetailDelegate?
    func getMovieTrailer(request: TrailerListRequest)
    {
        let resource = MovieTrailerResource()
        resource.GetTrailers(request: request) { result in
            if result != nil{
            self.delegate?.DidGetTrailerlist(response: result!)
            }
        }
    }
}
