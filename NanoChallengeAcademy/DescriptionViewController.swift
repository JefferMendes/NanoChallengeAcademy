//
//  DescriptionViewController.swift
//  NanoChallengeAcademy
//
//  Created by Bruno Marques Monteiro on 14/12/2018.
//  Copyright © 2018 Emanuel Jefferson Mendes Vasconcelos. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var productDescriptionTable: UITableView!
    var products: ProductForView?
    var keys = [String]()
    var values = [Double]() {
        didSet {
            productDescriptionTable.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productDescriptionTable.delegate = self
        productDescriptionTable.dataSource = self
        
        let p = products?.precos.sorted(by: { (a, b) -> Bool in
            a.value < b.value
        })
        
        
        
        for (key, value) in p! {
            keys.append(key)
            values.append(value)
        }
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
