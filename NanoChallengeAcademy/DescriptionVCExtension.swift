//
//  DescriptionVCExtension.swift
//  NanoChallengeAcademy
//
//  Created by Bruno Marques Monteiro on 14/12/2018.
//  Copyright © 2018 Emanuel Jefferson Mendes Vasconcelos. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension DescriptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Retornar tamanho do "vetor" de produtos clicados
        return (keys.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Supostamente aqui deve ser populado a partir da primeira viewcontroller, nao sei como trabalhar com isso
        let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! DescriptionTableViewCell
        let local = keys[indexPath.row]
        let preco = values[indexPath.row]
        
        cell.placeDescriptionProduct.text = local
        cell.priceDescriptionProduct.text = String(preco)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return products?.nome
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        var editTxtField: UITextField?
        let editPrice = UITableViewRowAction(style: .default, title: "Editar", handler: {(action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            let alertController = UIAlertController(title: nil, message: "Digite o novo preço", preferredStyle: .alert)
            let send = UIAlertAction(title: "Enviar", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
                
                if let userInput = editTxtField!.text {
                    //Inserir funcao para enviar para o preco para o coredata
                    let fetchRequest: NSFetchRequest<Produto> = Produto.fetchRequest()
                    
                    let predicate1 = NSPredicate(format: "estabelecimento CONTAINS[cd] %@", self.keys[indexPath.row])
                    let predicate2 = NSPredicate(format: "nome CONTAINS[cd] %@", (self.products?.nome)!)
                    
                    let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate1,predicate2])
                    
                    fetchRequest.predicate = predicate
                    
                    let produto = try? CoreDataManager.context.fetch(fetchRequest)
                    
                    produto?.first?.preco = Double(userInput)!
                    
                    CoreDataManager.saveContext()
                    
//                    self.values[indexPath.row] = Double(userInput)!
                    
                    self.products?.precos[self.keys[indexPath.row]] = Double(userInput)!
                    
                    let p = self.products?.precos.sorted(by: { (a, b) -> Bool in
                        a.value < b.value
                    })
                    
                    self.keys.removeAll()
                    self.values.removeAll()
                    
                    for (key, value) in p! {
                        self.keys.append(key)
                        self.values.append(value)
                    }
                    
                    print("User entered \(userInput)")
                }
                
                
                
            })
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                print("Cancel button tapped")
            }

            alertController.addAction(send)
            alertController.addAction(cancel)

            alertController.addTextField { (textField) -> Void in
                    editTxtField = textField
            }

            self.present(alertController, animated: true, completion: nil)
        })

        editPrice.backgroundColor = UIColor.green
        return [editPrice]
    }
    
    
}
