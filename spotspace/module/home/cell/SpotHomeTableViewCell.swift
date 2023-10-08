//
//  SpotHomeTableViewCell.swift
//  spotspace
//
//  Created by Adil Özdemir on 5.09.2023.
//

import Foundation
import UIKit
import Kingfisher

protocol SpotTableViewDelegate: AnyObject {
    func updateFavoriteCell(for spot: Spot)
}

class SpotHomeTableViewCell: UITableViewCell {
    var spot: Spot?
    
    static let identifier = "spotHomeTableViewCell"
    var delegate: SpotTableViewDelegate?
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ImageView, contentStackView, favouriteButton])
        stackView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 35)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
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
        titleLabel.font = .preferredFont(forTextStyle: .title2)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.numberOfLines = 0
        subTitleLabel.textColor = .gray
        subTitleLabel.font = .preferredFont(forTextStyle: .subheadline)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subTitleLabel
    }()
    
    lazy var favouriteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(systemName: "heart")?.withTintColor(.red), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.red), for: .selected)
        button.addTarget(self, action: #selector(favoriteButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 44).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }()
    
    func updateCell(with spot: Spot) {
        self.spot = spot
        ImageView.kf.setImage(with: URL(string: spot.imageUrl ?? ""))
        titleLabel.text = spot.name
        subTitleLabel.text = spot.subTitle
        favouriteButton.isSelected = spot.isFavourite ?? false
    }
    
    override func layoutSubviews() {
        ImageView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        ImageView.layer.cornerRadius = ImageView.frame.size.height / 10
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        selectionStyle = .none
        addSubview(mainStackView)
        
        mainStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func favoriteButtonClicked() {
        delegate?.updateFavoriteCell(for: spot!)
    }
    
    func setFavourite(isFavourite: Bool) {
        favouriteButton.isSelected = isFavourite
    }
}
