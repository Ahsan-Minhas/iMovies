//
//  UpcomingMovies+EXT.swift
//  iMovies
//
//  Created by Mac on 03/04/2022.
//

import UIKit
extension UpComingMoviesView:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UpcomingMoviesData != nil{
            if searching {
                      return SearchedMovies.count
                  } else {
                      return UpcomingMoviesData.results.count
                      
                  }
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nib1 = UINib(nibName: Constants.UpcomingMoviesCellName, bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: Constants.UpcomingMoviesCellName)
        let  cell = tableView.dequeueReusableCell(withIdentifier: Constants.UpcomingMoviesCellName) as! UpcomingMoviesCell
        if searching {
            cell.MovieTitleLbl.text = SearchedMovies[indexPath.row].originalTitle
            guard SearchedMovies[indexPath.row].backdropPath != nil else {
                return cell
            }
            let ImgUrl = URL(string: ApiEndpoints_APIKey.ImagesApi + SearchedMovies[indexPath.row].backdropPath!)
            cell.ThumbImg.loadImageFromUrl(fromURL: ImgUrl!, placeHolder: Constants.Placeholder)
        }
        else{
            cell.MovieTitleLbl.text = UpcomingMoviesData.results[indexPath.row].originalTitle
            guard UpcomingMoviesData.results[indexPath.row].backdropPath != nil else {
                return cell
            }
            let ImgUrl = URL(string: ApiEndpoints_APIKey.ImagesApi + UpcomingMoviesData.results[indexPath.row].backdropPath!)
            cell.ThumbImg.loadImageFromUrl(fromURL: ImgUrl!, placeHolder: Constants.Placeholder)
        }
       
      
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let vc = self.storyboard?.instantiateViewController(identifier: Constants.MoviesDetaiView) as! MoviesDetailVC

        if searching {
            vc.MovieData = SearchedMovies[indexPath.row]
        }
        else{
            vc.MovieData = UpcomingMoviesData.results[indexPath.row]
        }

      
        self.navigationController?.pushViewController(vc, animated: true)
        self.MySearch.searchTextField.endEditing(true)

    }
}
