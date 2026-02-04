//
//  DetailsView.swift
//  firstapp
//
//  Created by Tejasv Singh on 2/3/26.
//

import UIKit
class MovieDetailViewController: UIViewController{
    var movie: Movie?
    let posterImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let releaseeDateLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        displayMovieDetails()
    }
    func setUpUI(){
        posterImageView.contentMode = .scaleAspectFit
        posterImageView.clipsToBounds = true
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(posterImageView)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
                titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints=false
                view.addSubview(titleLabel)
                
                descriptionLabel.font = UIFont.systemFont(ofSize: 16)
                descriptionLabel.numberOfLines = 0
                descriptionLabel.textColor = .gray
        descriptionLabel.translatesAutoresizingMaskIntoConstraints=false
                view.addSubview(descriptionLabel)
                
                releaseeDateLabel.font = UIFont.systemFont(ofSize: 14)
                releaseeDateLabel.textColor = .lightGray
        releaseeDateLabel.translatesAutoresizingMaskIntoConstraints=false
                view.addSubview(releaseeDateLabel)
        
        NSLayoutConstraint.activate([
         
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 300),
            
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            
            releaseeDateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            releaseeDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])

    }
    
    func displayMovieDetails() {
         guard let movie = movie else { return }
         
         titleLabel.text = movie.name
         descriptionLabel.text = movie.description
         releaseeDateLabel.text = "Release Date: \(movie.releaseDate ?? "N/A")"
         posterImageView.image = UIImage(systemName: movie.posterImage ?? "text.page.fill")
     }
}
