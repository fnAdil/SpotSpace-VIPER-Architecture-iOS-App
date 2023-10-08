//
//  SpotHomeTableViewCell.swift
//  spotspace
//
//  Created by Adil Özdemir on 5.09.2023.
//

import Foundation
import UIKit
import Kingfisher

class SpotHomeTableViewCell: UITableViewCell {
    
    static let identifier = "spotHomeTableViewCell"
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ImageView, contentStackView])
        stackView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.numberOfLines = 0
        subTitleLabel.textColor = .black
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subTitleLabel
    }()
    
    func updateCell(with spot: Spot) {
        ImageView.kf.setImage(with: URL(string: spot.imageUrl ?? ""))
        titleLabel.text = spot.name
        subTitleLabel.text = spot.description
    }
    
    override func layoutSubviews() {
        ImageView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        ImageView.layer.cornerRadius = ImageView.frame.size.height / 10
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mainStackView)
        
        mainStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
