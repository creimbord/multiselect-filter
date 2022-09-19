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
        let phoneModelFilter = PhoneModelFilter(phoneFilter: PhoneBaseFilter())
        let phoneColorFilter = PhoneColorFilter(phoneFilter: phoneModelFilter)
        let phoneMemoryFilter = PhoneMemoryFilter(phoneFilter: phoneColorFilter)
        dataSource.phones = phoneMemoryFilter.filter(phones: dataSource.phones, by: [.model("iPhone 8"), .model("iPhone 13 Pro Max"), .memory(2), .color("Gold"), .memory(8), .color("White")])
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
