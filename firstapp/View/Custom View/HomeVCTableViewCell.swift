//
//  HomeVCTableViewCell.swift
//  firstapp
//
//  Created by Shobhakar Tiwari on 1/23/26.
//

import UIKit

class HomeVCTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel?
    var descriptionLabel: UILabel?
    var posterImage: UIImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpUI() {
        titleLabel = UILabel()
        titleLabel?.textColor = .red
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel?.numberOfLines = 0
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel!)
    
        /// descriptionLabel
        descriptionLabel = UILabel()
        descriptionLabel?.textColor = .black
        descriptionLabel?.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel?.numberOfLines = 0
        contentView.addSubview(descriptionLabel!)
        
        posterImage = UIImageView()
        posterImage?.translatesAutoresizingMaskIntoConstraints=false
        //posterImage?.contentMode = .scaleAspectFill
        contentView.addSubview(posterImage!)
        
        if let titleLabel = titleLabel, let descriptionLabel = descriptionLabel, let posterImage=posterImage {
            NSLayoutConstraint.activate([
                posterImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                posterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                posterImage.widthAnchor.constraint(equalToConstant: 80),
                posterImage.heightAnchor.constraint(equalToConstant: 80),
                
                titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 5),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
              
    
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
                descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
                descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                
                
                
                
                
            ])
        }
    }
    
    func setData(movie: Movie) {
        titleLabel?.text = movie.name ?? ""
        descriptionLabel?.text = movie.description ?? ""
        posterImage?.image = UIImage(systemName: movie.posterImage ?? "")
    }
}
