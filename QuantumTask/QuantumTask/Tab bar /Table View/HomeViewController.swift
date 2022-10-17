//
//  HomeViewController.swift
//  QuantumTask
//
//  Created by Medunan on 16/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let tableView = UITableView()
    var items: [Menu] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = fetchData()
        view.backgroundColor = .systemBackground
        
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        fetchData()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
//        tableView.allowsSelection = true
        title = "Home"
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.rowHeight = 120
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseID)
        
    }
        
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseID) as! HomeTableViewCell
        let menuItems = items[indexPath.row]
        cell.set(menu: menuItems)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        let item = Menu(imageName: , title: <#T##String#>)
    }
    
   
}


extension HomeViewController {
    
    func fetchData() -> [Menu] {
        let img1 = Menu(imageName: MenuImages.banana, title: "banana")
        let img2 = Menu(imageName: MenuImages.carrot, title: "carrot")
        let img3 = Menu(imageName: MenuImages.lemon, title: "lemon")
        let img4 = Menu(imageName: MenuImages.onions, title: "onions")
        let img5 = Menu(imageName: MenuImages.potatoes, title: "potatoes")
        let img6 = Menu(imageName: MenuImages.tomato, title: "tomato")
        let img7 = Menu(imageName: MenuImages.tomatoe, title: "tomatoe")
        
        return [img1,img2,img3,img4,img5,img6,img7]
    }
}
