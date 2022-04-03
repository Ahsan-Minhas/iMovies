//
//  MoviesDetailVCViewController.swift
//  iMovies
//
//  Created by Mac on 02/04/2022.
//

import UIKit
import AVKit

class MoviesDetailVC: UIViewController {
    
    
    
    @IBOutlet weak var GetTicketBtn: UIButton!
    @IBOutlet weak var MoviePoster: lazyImageView!
    @IBOutlet weak var MovieName: UILabel!
    @IBOutlet weak var ReleasingLbl: UILabel!
    @IBOutlet weak var MovieOverViewLbl: UILabel!
    @IBOutlet weak var WatchTrailerBtn: UIButton!
    
    
    var MovieData: Result? = nil
    var TrailerData: TrailerListResponse?
    var DetailVM = MovieDetailVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
        DetailVM.delegate = self
        let request = TrailerListRequest(MovieID: self.MovieData!.id, ApiKey: ApiEndpoints_APIKey.Api_key)
        DetailVM.getMovieTrailer(request: request)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    private func UpdateUI()
    {
        

        self.MovieName.text = MovieData?.originalTitle
        self.ReleasingLbl.text = Constants.InTheater + MovieData!.releaseDate
        self.MovieOverViewLbl.text = MovieData?.overview
        GetTicketBtn.layer.cornerRadius = 10
        WatchTrailerBtn.layer.cornerRadius = 10
        WatchTrailerBtn.layer.borderWidth = 0.8
        WatchTrailerBtn.layer.borderColor = hexStringToUIColor(hex: Constants.ColorForWatchBtn).cgColor
        guard MovieData?.posterPath != nil else {
            return
        }
        let posterURL = URL(string: ApiEndpoints_APIKey.ImagesApi + MovieData!.posterPath)
        self.MoviePoster.loadImageFromUrl(fromURL: posterURL!, placeHolder: Constants.Placeholder)
        
    }

    @IBAction func WatchTrailer(_ sender: UIButton) {
      //  let url = URL(string: "https://www.youtube.com/watch?v=lO14uC8kn58")!
        let vc = self.storyboard?.instantiateViewController(identifier: Constants.Playerview) as! PlayerView
        guard TrailerData != nil else
        {
            return
        }
        vc.videoIDs = TrailerData?.results
        self.navigationController?.pushViewController(vc, animated: true)
    
        //"G5kzUpWAusI"
            
    }
    @IBAction func bckbtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
  
}



extension MoviesDetailVC:MovieDetailDelegate
{
func DidGetTrailerlist(response: TrailerListResponse) {
    TrailerData = response
}

    func DidFailedToGetTrailer() {
        
    }
}
