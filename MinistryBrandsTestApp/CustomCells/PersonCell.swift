//
//  PersonCell.swift
//  MinistryBrandsTestApp
//
//  Created by Taylor Smith on 11/20/19.
//  Copyright © 2019 Taylor Smith. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
    
    let containerView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 0, height: 50)
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor.white
        return view
    }()
    
     let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(containerView)
        containerView.addSubview(personImageView)
        containerView.addSubview(nameLabel)
        addConstraints()
        cellSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
    }
    
    class func cellHeight() -> CGFloat {
        return 100
    }

    func cellSetup() {
        self.selectionStyle = .none
        contentView.backgroundColor = UIColor.jungleGreen
    }
    
    
    func addConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        personImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        personImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: containerView.frame.height / 2).isActive = true
        personImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        personImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 20).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: personImageView.centerYAnchor, constant: 0).isActive = true
    }

}
