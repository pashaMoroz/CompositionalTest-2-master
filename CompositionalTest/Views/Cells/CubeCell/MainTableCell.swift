//
//  MainTableCell.swift
//  CompositionalTest
//
//  Created by Pavel Moroz on 22.06.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class MainTableCell: UITableViewCell {

    static let reuseId = "MainTableCell"

    let screenSize: CGRect = UIScreen.main.bounds

    let mainLabel = UILabel()
    let descriptionLabel = UILabel()
    let actionButton = UIButton()

    var portraitConstraint: Bool!
    var landscapeConstrain: Bool!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)


        print(UIDevice.current.orientation.rawValue)

        if screenSize.width < screenSize.height {

            setupElements(orientationPortreint: true)

        } else {

            setupElements(orientationPortreint: false)
        }
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        print(UIDevice.current.orientation.rawValue)

         if screenSize.width < screenSize.height {
            setupElements(orientationPortreint: true)
        } else {

            setupElements(orientationPortreint: false)
        }

    }

    func setupElements(orientationPortreint: Bool) {

        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false

        addSubview(mainLabel)
        addSubview(descriptionLabel)
        addSubview(actionButton)

        mainLabel.font = UIFont.sfProDisplaySemibold(ofSize: 20)

        descriptionLabel.font = UIFont.sfProTextRegular(ofSize: 16)
        descriptionLabel.numberOfLines = 0

        actionButton.layer.cornerRadius = 8

        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])

        if orientationPortreint == true {

            NSLayoutConstraint.activate([

                actionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
                actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                actionButton.heightAnchor.constraint(equalToConstant: 50)

            ])
        } else {

            NSLayoutConstraint.activate([
                actionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
                actionButton.widthAnchor.constraint(equalToConstant: 382),
                actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                actionButton.heightAnchor.constraint(equalToConstant: 50)
            ])

        }

        bottomAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 24).isActive = true
    }

    func setupCell (mainLabel: String, description: String, buttonName: String, color: UIColor, buttonColor: UIColor) {
        self.mainLabel.text = mainLabel
        self.descriptionLabel.text = description
        self.actionButton.setTitle(buttonName, for: .normal)
        self.backgroundColor = color
        self.actionButton.backgroundColor = buttonColor
    }
}
