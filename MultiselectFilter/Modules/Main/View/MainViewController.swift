//
//  MainViewController.swift
//  MultiselectFilter
//
//  Created by Родион on 03.09.2021.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let dataSource = MainDataSource()
    private let specifications: [Specification] = [
        .diskSpace(256),
        .diskSpace(512),
        .color("Starlight"),
        .color("Space Black"),
        .price(1299)
    ]
    
    // MARK: - Views
    private lazy var filterButton: UIBarButtonItem = {
        let image = UIImage(systemName: "slider.horizontal.3")
        return UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(openFilter)
        )
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = dataSource
        tableView.register(PhoneCell.self, forCellReuseIdentifier: "PhoneCell")
        return tableView
    }()
    
    // MARK: - Life cycle
    override func loadView() {
        super.loadView()
        setupViews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phoneColorFilter = PhoneColorFilter(phoneFilter: PhoneBaseFilter())
        let phoneDiskSpaceFilter = PhoneDiskSpaceFilter(phoneFilter: phoneColorFilter)
        let phonePriceFilter = PhonePriceFilter(phoneFilter: phoneDiskSpaceFilter)
        
        dataSource.phones = phonePriceFilter.filter(
            phones: dataSource.phones,
            by: specifications
        )
        
        tableView.reloadData()
    }
}

// MARK: - Actions
private extension MainViewController {
    @objc func openFilter() {
        print("Opening filter...")
    }
}

// MARK: - Setup views
private extension MainViewController {
    func setupViews() {
        addSubviews()
        setupConstraints()
        view.backgroundColor = .white
    }
    
    func addSubviews() {
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = filterButton
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
