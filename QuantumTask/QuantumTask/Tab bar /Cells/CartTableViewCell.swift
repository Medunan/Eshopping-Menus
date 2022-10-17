//
//  CartTableViewCell.swift
//  QuantumTask
//
//  Created by Medunan on 16/10/22.
//

import UIKit

struct CartTableViewCellViewModel {
    let viewModels: [TileCollectionViewCellViewModel]
}

class CartTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "CartTableViewCell"
    var Dbutton = QtButton(backgroundColor: .red, title: "Delete Cart")
    var Cbutton = QtButton(backgroundColor: .blue, title: "Check Out")
    
    private var viewModels: [TileCollectionViewCellViewModel] = []
    
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TileCollectionViewCell.self, forCellWithReuseIdentifier: TileCollectionViewCell.identifier)
        collectionView.backgroundColor = .systemBackground
        return collectionView
        
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
       
    }
    
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = CGRect(x: 0, y: 0, width: contentView.bounds.size.width, height: contentView.bounds.size.height - 40)
        addSubview(Dbutton)
        addSubview(Cbutton)
        
        Dbutton.translatesAutoresizingMaskIntoConstraints = false
        Cbutton.translatesAutoresizingMaskIntoConstraints = false
        
        Tableconfigure()
        
    }
    
    func Tableconfigure() {
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            Cbutton.topAnchor.constraint(equalTo:collectionView.bottomAnchor, constant: -padding ),
            Cbutton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            Cbutton.widthAnchor.constraint(equalToConstant: 120),
            Cbutton.heightAnchor.constraint(equalToConstant: 50),
            
            Dbutton.topAnchor.constraint(equalTo:collectionView.bottomAnchor, constant: -padding ),
            Dbutton.trailingAnchor.constraint(equalTo: Cbutton.leadingAnchor, constant: -padding),
            Dbutton.widthAnchor.constraint(equalToConstant: 120),
            Dbutton.heightAnchor.constraint(equalToConstant: 50)


        ])
    }
    
    func set(with viewModel: CartTableViewCellViewModel) {
        self.viewModels = viewModel.viewModels
        collectionView.reloadData()
    }
}
    
    //MARK: - CollectionView



extension CartTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TileCollectionViewCell.identifier, for: indexPath) as! TileCollectionViewCell
        cell.set(with: viewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = contentView.frame.size.width / 3
        return CGSize(width: width, height: 150)
    }
   
    
}

extension CartTableViewCell {
    
    
}
