//
//  CartViewController.swift
//  QuantumTask
//
//  Created by Medunan on 16/10/22.
//

import UIKit

class CartViewController: UIViewController {
    
    private let carttableView = UITableView()
    
    private let viewModels: [CartTableViewCellViewModel] = [
        CartTableViewCellViewModel(
            viewModels: [
                TileCollectionViewCellViewModel(image: MenuImages.banana, title: "banana"),
                TileCollectionViewCellViewModel(image: MenuImages.carrot, title: "carrot"),
                TileCollectionViewCellViewModel(image: MenuImages.lemon, title: "lemon"),
                TileCollectionViewCellViewModel(image: MenuImages.onions, title: "onions"),
                TileCollectionViewCellViewModel(image: MenuImages.potatoes, title: "potatoes"),
                TileCollectionViewCellViewModel(image: MenuImages.tomato, title: "tomato"),
                TileCollectionViewCellViewModel(image: MenuImages.tomatoe, title: "tomatoe"),
            ]
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(carttableView)
        
        title = "Cart"
        carttableView.frame = view.bounds
        carttableView.delegate = self
        carttableView.dataSource = self
        carttableView.rowHeight = 280
        
        carttableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
    }
    


}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Hi"
        let viewModel = viewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell
        cell.set(with: viewModel)
        return cell
    }
    
    
    
    
}


