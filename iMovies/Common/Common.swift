//
//  Common.swift
//  MVVM
//
//  Created by Mac on 01/03/2022.
//

import Foundation
import UIKit

struct Constants {
    static let ErrorAlertTitle = "Error"
    static let OkAlertTitle = "Ok"
    static let CancelAlertTitle = "Cancel"
    static let UpcomingMoviesCellName = "UpcomingMoviesCell"
    static let Placeholder = "placeHolderImage"
    static let MoviesDetaiView = "MoviesDetailVC"
    static let Playerview = "PlayerView"
    static let ColorForWatchBtn = "#61C3F2"
    static let InTheater = "In Theaters"
}

struct ApiEndpoints_APIKey
{
    
    static let ImagesApi = "https://image.tmdb.org/t/p/w500"
    static let MoviesBaseUrl = "https://api.themoviedb.org/3/movie/"
    static let Api_key = "a6f047c62821fae13fbc59b83f66a0e2"
    static let UpcomingMovies = "https://api.themoviedb.org/3/movie/upcoming"
    static let MovieDetailApi = "https://api.themoviedb.org/3/movie/"
    static let imagesEP = "https://api.themoviedb.org/3/movie"
    
    
}
class COMMON_ALERT {
  
    
    
    class func showAlert (msg:String)
    {
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            return
        }))
        let viewController = UIApplication.shared.keyWindow?.rootViewController
        
        let popPresenter = alert.popoverPresentationController
        popPresenter?.sourceView = viewController?.view
        popPresenter?.sourceRect = (viewController?.view.bounds)!
        DispatchQueue.main.async {
                    viewController?.present(alert, animated: true, completion: nil)
        }
    }
}


