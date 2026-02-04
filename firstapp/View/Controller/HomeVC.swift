//
//  HomeVC.swift
//  firstapp
//
//  Created by Shobhakar Tiwari on 1/23/26.
//

import UIKit

/// Controller ---->>>  UI

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Property
    var movieTableView: UITableView?
    var titleLabel: UILabel?
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
        titleLabel = UILabel()
        titleLabel?.text = "POPULAR MOVIES"
        titleLabel?.textColor = .white
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        movieTableView = UITableView()
        movieTableView?.dataSource = self
        movieTableView?.delegate=self
        movieTableView?.translatesAutoresizingMaskIntoConstraints = false
        movieTableView?.register(HomeVCTableViewCell.self, forCellReuseIdentifier: "homeTableViewCell")
        movieTableView?.rowHeight = UITableView.automaticDimension
        movieTableView?.estimatedRowHeight = 300

        if let movieTableView = movieTableView, let titleLabel = titleLabel {
            view.addSubview(titleLabel)
            view.addSubview(movieTableView)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                movieTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                movieTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                movieTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                movieTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = viewModel.movie(at: indexPath.row)
        
        let detailVC = MovieDetailViewController()
        detailVC.movie = selectedMovie
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}


