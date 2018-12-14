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
    
    @IBAction func addProduct(_ sender: Any) {
        //Funcao para entrar na AddProductModalViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTable.delegate = self
        productTable.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

