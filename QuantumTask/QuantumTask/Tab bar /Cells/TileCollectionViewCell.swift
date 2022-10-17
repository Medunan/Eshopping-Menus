//
//  TileCollectionViewCell.swift
//  QuantumTask
//
//  Created by Medunan on 16/10/22.
//

import UIKit

struct TileCollectionViewCellViewModel {
    let image : UIImage
    let title : String
}

class TileCollectionViewCell: UICollectionViewCell  {
    
    static let identifier = "TileCollectionViewCell"
    
    var cview = UIView()
    
    var iconImageView = UIImageView()
    var productLabel  = LabelEditor(textAlignment: .center, fontSize: 15)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with viewModel: TileCollectionViewCellViewModel) {
        iconImageView.image = viewModel.image
        productLabel.text = viewModel.title
    }
    
    func configure() {
        addSubview(iconImageView)
        addSubview(productLabel)
        
        
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        productLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            
            
            
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor, multiplier: 16/9),
            
            productLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: padding),
            productLabel.leadingAnchor.constraint(equalTo: iconImageView.leadingAnchor),
            productLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productLabel.heightAnchor.constraint(equalToConstant: 25)
            
            
        ])
    }
    
    
}
