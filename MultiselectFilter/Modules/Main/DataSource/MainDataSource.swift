//
//  MainDataSource.swift
//  MultiselectFilter
//
//  Created by Родион on 16.09.2021.
//

import UIKit

final class MainDataSource: NSObject {
    
    // MARK: - Properties
    var phones = [
        Phone(
            model: "iPhone 8",
            price: 499,
            screenSize: 4,
            processor: "A9",
            memory: 2,
            diskSpace: 256,
            color: "White"
        ),
        Phone(
            model: "iPhone 12 Pro",
            price: 1299,
            screenSize: 6,
            processor: "A13 Bionic",
            memory: 6,
            diskSpace: 512,
            color: "Black"
        ),
        Phone(
            model: "iPhone 13 Pro Max",
            price: 1799,
            screenSize: 6.5,
            processor: "A15 Bionic",
            memory: 8,
            diskSpace: 1024,
            color: "Gold"
        )        
    ]
}

// MARK: - UITableViewDataSource
extension MainDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell") as! PhoneCell
        cell.configure(with: phones[indexPath.row])
        return cell
    }
}
