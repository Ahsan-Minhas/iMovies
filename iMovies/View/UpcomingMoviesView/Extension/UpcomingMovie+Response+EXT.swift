//
//  UpcomingMovie+Response+EXT.swift
//  iMovies
//
//  Created by Mac on 03/04/2022.
//

import Foundation
extension UpComingMoviesView:UpcomingMoviesDelegate{
    func DidGetMoviesData(response: UpcomingMoviesResponse) {
       
        UpcomingMoviesData = response
        
        DispatchQueue.main.async {
            self.tableView.reloadData()

        }
    }
    
    func DidFailedToGetData(failedResponse: RequestFailed) {
        
    }
    
    
}
