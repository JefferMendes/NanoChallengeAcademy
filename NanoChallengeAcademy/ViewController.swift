//
//  ViewController.swift
//  NanoChallengeAcademy
//
//  Created by Emanuel Jefferson Mendes Vasconcelos on 13/12/2018.
//  Copyright © 2018 Emanuel Jefferson Mendes Vasconcelos. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var productTable: UITableView!
    @IBOutlet weak var productSearchBar: UISearchBar!
    
    var productList = [ProductForView]() {
        didSet {
            self.productTable.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTable.delegate = self
        productTable.dataSource = self
        
        productSearchBar.delegate = self
        
        
        productList = Searches.buscaCoreData(consulta: "")
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //fetch para atualizar os produtos
        //talvez chamar funcao da searchBar
        productList = Searches.buscaCoreData(consulta: "")
        
    }

}

