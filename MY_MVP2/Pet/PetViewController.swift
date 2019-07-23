//
//  PetViewController.swift
//  MY_MVP2
//
//  Created by Reza Khalafi on 7/21/19.
//  Copyright © 2019 Reza Khalafi. All rights reserved.
//

import UIKit

class PetViewController: UIViewController,PetPresenterDelegate {
    
    var dataSourceArr:Array<Pet>? = []
    private let presenter:PetPresenter = PetPresenter()
    private static let PetTableViewCell = "PetTableViewCell"
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupPresenter()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func updateData(pets: Array<Pet>?) {
        dataSourceArr = pets
        tableView.reloadData()
    }
    
    @objc func addButtonClicked(sender:UIButton) {
        presenter.add(pets: dataSourceArr)
    }
}

extension PetViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PetViewController.PetTableViewCell, for: indexPath) as! PetTableViewCell
        let pet = dataSourceArr?[indexPath.row]
        cell.nameLabel.text = pet?.name ?? ""
        cell.genderLabel.text = pet?.gender.map { $0.rawValue }
        return cell
        
    }
    
    
}

extension PetViewController {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: PetViewController.PetTableViewCell, bundle: nil), forCellReuseIdentifier: PetViewController.PetTableViewCell)
    }
    
    func setupPresenter() {
        presenter.setViewDelegate(presenterDelegate: self)
        presenter.prepareData()
    }
}
