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
    func updateFavourite(with spot: Spot)
    func updateFavourite(with error: String)
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
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
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
    
    func updateFavourite(with spot: Spot) {
        DispatchQueue.main.async {
            guard let rowIndex = self.spots.firstIndex(where: {$0.id == spot.id}) else { return }
            let indexPath = IndexPath(row: rowIndex, section: 0)
            self.spots[indexPath.row] = spot
            guard let cell = self.tableView.cellForRow(at: indexPath) as? SpotHomeTableViewCell else { return }
            cell.setFavourite(isFavourite: spot.isFavourite ?? false)
        }
    }
    
    func updateFavourite(with error: String) {
        DispatchQueue.main.async {
            
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
        cell.delegate = self
        cell.updateCell(with: spots[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.router?.navigate(with: spots[indexPath.row], rootviewController: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

        }
    }
}

extension HomeViewController: SpotTableViewDelegate {
    func updateFavoriteCell(for spot: Spot) {
        presenter?.updateFavourite(with: spot)
    }
}
