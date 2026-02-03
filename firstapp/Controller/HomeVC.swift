//
//  HomeVC.swift
//  firstapp
//
//  Created by Shobhakar Tiwari on 1/23/26.
//

import UIKit

/// Controller ---->>>  UI

class HomeVC: UIViewController, UITableViewDataSource {
    
    // MARK: Property
    var movieTableView: UITableView?
    var viewModel: HomeViewModel = HomeViewModel()
    
    // MARK: View Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load movies
        viewModel.loadMovies()
        
        // setup tableview
        setupUI()
    }
    
    func setupUI() {
        movieTableView = UITableView()
        movieTableView?.dataSource = self
        movieTableView?.translatesAutoresizingMaskIntoConstraints = false
        movieTableView?.register(HomeVCTableViewCell.self, forCellReuseIdentifier: "homeTableViewCell")
        
        if let movieTableView = movieTableView {
            view.addSubview(movieTableView)
            
            NSLayoutConstraint.activate([
                movieTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                movieTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                movieTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                movieTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                ])
        }
    }
    
    // MARK: TableView Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath) as? HomeVCTableViewCell
                
        let movie = viewModel.movie(at: indexPath.row)
        // set the data to the cell
        homeCell?.setData(movie: movie)
        return homeCell!
    }
}


