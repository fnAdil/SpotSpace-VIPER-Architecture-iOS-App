//
//  HomeViewController.swift
//  spotspace
//
//  Created by Adil Özdemir on 4.09.2023.
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func update(with spot: [Spot])
    func update(with error: String)
}

protocol SpotTableViewDelegate: AnyObject {
    func updateFavoriteCell(for spotId: Int, isFavorite: Bool)
}

class HomeViewController: UIViewController, HomeViewProtocol {
    
    var presenter: HomePresenterProtocol?
    
    var spots: [Spot] = [Spot]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        label.textColor = .black
        label.text = "null"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SpotHomeTableViewCell.self, forCellReuseIdentifier: SpotHomeTableViewCell.identifier)
    }
    
    func update(with spot: [Spot]) {
        DispatchQueue.main.async {
            self.spots = spot
            self.tableView.isHidden = false
            self.label.isHidden = true
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.spots = []
            self.label.isHidden = false
            self.tableView.isHidden = true
            self.label.text = "Error: \(error)"
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SpotHomeTableViewCell.identifier, for: indexPath) as? SpotHomeTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.updateCell(with: spots[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.router?.navigate(with: spots[indexPath.row], rootviewController: self)
    }
    
}

extension HomeViewController: SpotTableViewDelegate {
    func updateFavoriteCell(for spotId: Int, isFavorite: Bool) {
        //TODO: update Favorite cell here
    }
}
