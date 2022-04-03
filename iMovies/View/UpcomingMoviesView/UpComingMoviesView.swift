//
//  ViewController.swift
//  iMovies
//
//  Created by Mac on 02/04/2022.
//

import UIKit

class UpComingMoviesView: UIViewController {
    @IBOutlet weak var MySearch: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
     var UpcomingMoviesData: UpcomingMoviesResponse!
    var SearchedMovies = [Result]()

     var UpcomingVM = UpcomingMoviesVM()
     var searching = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.MySearch.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 10;
        self.tableView.rowHeight = UITableView.automaticDimension
        UpcomingVM.delegate = self
        let request = UpcomingMoviesRequest(ApiKey: ApiEndpoints_APIKey.Api_key)
        UpcomingVM.getUpcomingMovies(request: request)
    }

//    func setupSearchBar(){}
    

}


extension UpComingMoviesView: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""
        {
            searching = true
            tableView.reloadData()
            return
        }
        SearchedMovies = UpcomingMoviesData.results.filter { $0.originalTitle.range(of: searchText, options: .caseInsensitive) != nil }
              searching = true
        tableView.reloadData()
              
       }
       
       func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           searching = false
                   MySearch.text = ""
                   tableView.reloadData()
       }
}
