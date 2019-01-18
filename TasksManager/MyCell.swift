//
//  MyCell.swift
//  TasksManager
//
//  Created by xerasy on 1/17/19.
//  Copyright © 2019 blackDevIos. All rights reserved.
//

import Foundation
import UIKit

class MyCell: UITableViewCell {
    
    static let reuseIdentifier = "cell"
    
    let todoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let todoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    func setup() {
        self.addSubview(todoImageView)
        self.addSubview(todoLabel)
        
        todoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        todoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        todoImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        todoImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        todoLabel.leftAnchor.constraint(equalTo: todoImageView.rightAnchor, constant: 15).isActive = true
        todoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
