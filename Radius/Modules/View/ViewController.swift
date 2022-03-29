//
//  ViewController.swift
//  Radius
//
//  Created by Shreyansh Raj Keshri on 28/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var propertiesTableView: UITableView!
    
    
    //MARK: - Properties
    var propertiesVM: PropertiesVMProtocol = PropertiesViewModel()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableView()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Add code here
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Add code here
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Add code here
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Add code here
    }
    
    //MARK: Register TableView
    fileprivate func registerTableView() {
        propertiesTableView.delegate = self
        propertiesTableView.dataSource = self
        
        let cellNib = UINib(nibName: "PropertiesTableViewCell", bundle: .main)
        propertiesTableView.register(cellNib, forCellReuseIdentifier: "PropertiesTableViewCell")
        
        let headerNib = UINib(nibName: "CustomHeaderView", bundle: .main)
        propertiesTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
    }
    
    //MARK: Data fetching
    fileprivate func fetchData() {
        propertiesVM.fetchDetails { value in
            self.propertiesTableView.reloadData()
        }
    }
    
}

