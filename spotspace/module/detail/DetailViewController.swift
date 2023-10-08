//
//  DetailViewController.swift
//  spotspace
//
//  Created by Adil Özdemir on 5.09.2023.
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }
}

class DetailViewController: UIViewController, DetailViewProtocol {
    
    var presenter: DetailPresenterProtocol?
    
    private var spot: Spot
    private lazy var spotTableViewDelegate: SpotTableViewDelegate? = nil
    
    private lazy var stackView = ScrollableStackView(spot: spot)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavbar()
        addStackView()
    }
    
    func configureNavbar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.hidesBackButton = false
    }
    
    func addStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 24
        stackView.clipsToBounds = true
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    init(data spot: Spot, delegate spotTableViewDelegate: SpotTableViewDelegate) {
        self.spot = spot
        super.init(nibName: nil, bundle: nil)
        self.spotTableViewDelegate = spotTableViewDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
