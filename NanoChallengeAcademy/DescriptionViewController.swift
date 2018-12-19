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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productDescriptionTable.delegate = self
        productDescriptionTable.dataSource = self
        
        self.products!.precos = (self.products?.precos.sorted { a ,b in a.preco < b.preco })!
        

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
