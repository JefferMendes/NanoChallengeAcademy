//
//  ViewControllerExtension.swift
//  NanoChallengeAcademy
//
//  Created by Emanuel Jefferson Mendes Vasconcelos on 14/12/2018.
//  Copyright © 2018 Emanuel Jefferson Mendes Vasconcelos. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        let prod = productList[indexPath.row]
        
        cell.nameProduct.text = prod.precos.first?.nome
        
        let r = prod.menorPreco()
        cell.priceProduct.text = String(format:"R$%.2f",r.1)
        cell.placeProduct.text = r.0
        
        cell.dateProduct.text = r.2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? DescriptionViewController
        
        destination?.products = productList[(productTable.indexPathForSelectedRow?.row)!]
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        productList = Searches.buscaCoreData(consulta: searchText)
    }
}
