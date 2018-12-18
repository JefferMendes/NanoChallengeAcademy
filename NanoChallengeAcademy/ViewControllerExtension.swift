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
        print("Exibindo product count")
        print(productList.count)
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        let prod = productList[indexPath.row]
        
        cell.nameProduct.text = prod.nome
        print("Passou por aqui vlw")
        print(prod.nome)
        
        let r = prod.menorPreco()
        cell.priceProduct.text = String(r.1)
        cell.placeProduct.text = r.0
        
        
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
        //let fetchRequest: NSFetchRequest<Produto> = Produto.fetchRequest()

//        if searchText != ""{
//            let predicate = NSPredicate(format: "nome CONTAINS[cd] %@", searchText)
//            //let predicate = NSPredicate(format: "precos CONTAINS[cd] %@", searchText)
//            fetchRequest.predicate = predicate
//        }
        productList = Searches.buscaCoreData(consulta: searchText)
//        self.productList = try? CoreDataManager.context.fetch(fetchRequest)
    }
}
