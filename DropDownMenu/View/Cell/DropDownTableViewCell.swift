//
//  DropDownTableViewCell.swift
//  DropDownMenu
//
//  Created by Julio Collado on 12/10/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class DropDownTableViewCell: UITableViewCell {
    static let reuseIdentifier = "DropDownTableViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        [titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor), titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)].forEach{$0.isActive = true}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
