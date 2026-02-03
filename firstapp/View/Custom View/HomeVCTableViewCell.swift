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
        posterImage?.backgroundColor = .lightGray
        posterImage?.contentMode = .scaleAspectFill
        contentView.addSubview(posterImage!)
        
        if let titleLabel = titleLabel, let descriptionLabel = descriptionLabel, let posterImage=posterImage {
            NSLayoutConstraint.activate([
                posterImage.topAnchor.constraint(equalTo: contentView.topAnchor),
                posterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                posterImage.widthAnchor.constraint(equalToConstant: 80),
                posterImage.heightAnchor.constraint(equalToConstant: 120),
                posterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                
                titleLabel.topAnchor.constraint(equalTo: posterImage.topAnchor, constant: 5),
                titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 5),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
              
    
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
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
