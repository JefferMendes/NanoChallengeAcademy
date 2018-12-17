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
        //Retornar tamanho do "vetor" de produtos
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        //Popular viewcontroller inicial
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Lembrar de passar o ID da Storyboard = DescriptionViewController | Nao confundir com identifier
        let vc = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as? DescriptionViewController
        //Popular viewcontroller secundaria
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let fetchRequest: NSFetchRequest<Produto> = Produto.fetchRequest()

        if searchText != ""{
            let predicate = NSPredicate(format: "nome CONTAINS[cd] %@", searchText)
            //let predicate = NSPredicate(format: "precos CONTAINS[cd] %@", searchText)
            fetchRequest.predicate = predicate
        }

//        self.productList = try? CoreDataManager.context.fetch(fetchRequest)
    }
}
