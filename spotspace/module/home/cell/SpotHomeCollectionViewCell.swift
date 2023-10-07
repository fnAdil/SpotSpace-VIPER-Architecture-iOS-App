//
//  SpotHomeCollectionViewCell.swift
//  spotspace
//
//  Created by Adil Özdemir on 5.09.2023.
//

import Foundation
import UIKit

class SpotHomeTableViewCell: UITableViewCell {
    
    static let identifier = "spotHomeTableViewCell"
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stackView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(contentStackView)
        
        contentStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
