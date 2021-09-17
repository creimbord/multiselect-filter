//
//  PhoneCell.swift
//  MultiselectFilter
//
//  Created by Родион on 16.09.2021.
//

import UIKit

final class PhoneCell: UITableViewCell {
    
    // MARK: - Properties
    private let boldFont: UIFont = .systemFont(ofSize: 14, weight: .bold)
    private let regularFont: UIFont = .systemFont(ofSize: 14, weight: .regular)
    
    // MARK: - Views
    private lazy var modelStackView = makeTitleStackView(title: "Model:", font: boldFont)
    private lazy var priceStackView = makeTitleStackView(title: "Price:", font: boldFont)
    private lazy var screenSizeStackView = makeTitleStackView(title: "Screen size:", font: boldFont)
    private lazy var processorStackView = makeTitleStackView(title: "Processor:", font: boldFont)
    private lazy var memoryStackView = makeTitleStackView(title: "Memory:", font: boldFont)
    private lazy var diskSpaceStackView = makeTitleStackView(title: "Disk space:", font: boldFont)
    private lazy var colorStackView = makeTitleStackView(title: "Color:", font: boldFont)
    private lazy var phoneStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            modelStackView, priceStackView, screenSizeStackView,
            processorStackView, memoryStackView, diskSpaceStackView,
            colorStackView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods
extension PhoneCell {
    func configure(with phone: Phone) {
        modelStackView.addArrangedSubview(
            makeLabel(text: phone.model, font: regularFont)
        )
        priceStackView.addArrangedSubview(
            makeLabel(text: "$\(phone.price)", font: regularFont)
        )
        screenSizeStackView.addArrangedSubview(
            makeLabel(text: "\(phone.screenSize) inch", font: regularFont)
        )
        processorStackView.addArrangedSubview(
            makeLabel(text: phone.processor, font: regularFont)
        )
        memoryStackView.addArrangedSubview(
            makeLabel(text: "\(phone.memory) Gb", font: regularFont)
        )
        diskSpaceStackView.addArrangedSubview(
            makeLabel(text: "\(phone.diskSpace) Gb", font: regularFont)
        )
        colorStackView.addArrangedSubview(
            makeLabel(text: phone.color, font: regularFont)
        )
    }
    
    private func makeLabel(text: String, font: UIFont) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = font
        return label
    }
    
    private func makeTitleLabel(text: String, font: UIFont) -> UILabel {
        let label = makeLabel(text: text, font: font)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }
    
    private func makeTitleStackView(title: String, font: UIFont) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [makeTitleLabel(text: title, font: font)])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }
}

// MARK: - Setup views
private extension PhoneCell {
    func setupViews() {
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        contentView.addSubview(phoneStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            phoneStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            phoneStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            phoneStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            phoneStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])
    }
}
