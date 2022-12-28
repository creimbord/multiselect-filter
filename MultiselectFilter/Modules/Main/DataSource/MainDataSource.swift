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
            model: "iPhone 14",
            price: 799,
            screenSize: 6.1,
            processor: "Apple A15 Bionic",
            memory: 6,
            diskSpace: 128,
            color: "Midnight"
        ),
        Phone(
            model: "iPhone 14 Plus",
            price: 899,
            screenSize: 6.7,
            processor: "Apple A15 Bionic",
            memory: 6,
            diskSpace: 256,
            color: "Starlight"
        ),
        Phone(
            model: "iPhone 14 Pro",
            price: 1299,
            screenSize: 6.1,
            processor: "Apple A16 Bionic",
            memory: 6,
            diskSpace: 512,
            color: "Space Black"
        ),
        Phone(
            model: "iPhone 14 Pro Max",
            price: 1599,
            screenSize: 6.7,
            processor: "Apple A16 Bionic",
            memory: 6,
            diskSpace: 1024,
            color: "Space Black"
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
