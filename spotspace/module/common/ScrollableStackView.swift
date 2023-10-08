//
//  ScrollableStackView.swift
//  spotspace
//
//  Created by Adil Özdemir on 7.10.2023.
//

import UIKit

class ScrollableStackView: UIView {
    
    private lazy var scrollView = UIScrollView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.layoutMargins = UIEdgeInsets(top: 85, left: 20, bottom: 20, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    let spot: Spot
    
    init(frame: CGRect = .zero, spot: Spot) {
        self.spot = spot
        super.init(frame: frame)
        commonInit()
        addTitleSection()
        addDivederLine()
        addDescriptionSection()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented..")
    }
    
    private func commonInit() {
        backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    func addTitleSection() {
        let titleLabel = UILabel()
        titleLabel.font = .preferredFont(forTextStyle: .title1)
        titleLabel.text = spot.name
        addArrangedSubview(titleLabel)
    }
    
    func addDivederLine() {
        let divider = UIView()
        divider.backgroundColor = .gray
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        addArrangedSubview(divider)
    }
    
    func addDescriptionSection() {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = spot.description
        addArrangedSubview(descriptionLabel)
    }

    func addArrangedSubview(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }
}
