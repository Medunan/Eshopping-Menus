//
//  HomeTableViewCell.swift
//  QuantumTask
//
//  Created by Medunan on 16/10/22.
//

import UIKit


class HomeTableViewCell: UITableViewCell {

    static let reuseID = "HomeCell"
    
    
    var name: String?
    
    let iconImageView = UIImageView()
    let productLabel = LabelEditor(textAlignment: .left, fontSize: 30)
    let addCartButton: UIButton = {
        let image = UIImage(named: "Cart") as UIImage?
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRectMake(0, 0, 30, 30)
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(menu: Menu) {
        iconImageView.image = menu.imageName
        productLabel.text = menu.title
    }
    
    private func configure() {
        addSubview(iconImageView)
        addSubview(productLabel)
        addSubview(addCartButton)
        
        iconImageView.layer.cornerRadius = 10
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        productLabel.translatesAutoresizingMaskIntoConstraints = false
        addCartButton.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor, multiplier: 16/9),
            
            addCartButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            addCartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            addCartButton.heightAnchor.constraint(equalToConstant: 30),
            addCartButton.widthAnchor.constraint(equalToConstant: 30),
            
            productLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            productLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: padding),
            productLabel.trailingAnchor.constraint(equalTo: addCartButton.leadingAnchor, constant: -padding),
            productLabel.heightAnchor.constraint(equalToConstant: 25),
           
            
        ])
        
    }
    
    
   
}
