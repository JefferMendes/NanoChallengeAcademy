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
        return (products?.precos.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Supostamente aqui deve ser populado a partir da primeira viewcontroller, nao sei como trabalhar com isso
        let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! DescriptionTableViewCell
        let local = self.products?.precos[indexPath.row].estabelecimento
        let data = self.products?.precos[indexPath.row].data
        if let preco = (self.products?.precos[indexPath.row].preco){
            cell.priceDescriptionProduct.text = String(format:"R$%.2f",preco)
        }
        
        cell.placeDescriptionProduct.text = local
        cell.dateDescriptionProduct.text = data
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return products?.precos.first?.nome
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        var editTxtField: UITextField?
        let editPrice = UITableViewRowAction(style: .default, title: "Editar", handler: {(action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            let alertController = UIAlertController(title: nil, message: "Digite o novo preço", preferredStyle: .alert)
            let send = UIAlertAction(title: "Enviar", style: .default, handler: { (action) -> Void in
                
                if let userInput = editTxtField!.text {
                    //Inserir funcao para enviar para o preco para o coredata
                    let fetchRequest: NSFetchRequest<Produto> = Produto.fetchRequest()
                    
                    let predicate1 = NSPredicate(format: "estabelecimento CONTAINS[cd] %@", (self.products?.precos[indexPath.row].estabelecimento)!)
                    let predicate2 = NSPredicate(format: "nome CONTAINS[cd] %@", (self.products?.precos.first!.nome)!)
                    
                    let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate1,predicate2])
                    
                    fetchRequest.predicate = predicate
                    
                    let produto = try? CoreDataManager.context.fetch(fetchRequest)

                    produto?.first?.preco = Double(userInput)!
                    
                    let currentDateTime = Date()
                    let formatter = DateFormatter()
                    formatter.timeStyle = .short
                    formatter.dateStyle = .short
                    
                    produto?.first?.data = formatter.string(from: currentDateTime)
                    
                    
                    CoreDataManager.saveContext()
                    
                    self.products?.precos[indexPath.row].preco = Double(userInput)!
                    
                    self.products!.precos = (self.products?.precos.sorted { a ,b in a.preco < b.preco })!
                    
                    self.productDescriptionTable.reloadData()

                    
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

        editPrice.backgroundColor = UIColor(red: 0.02, green: 0.78, blue: 0.01, alpha: 1.0)
        return [editPrice]
    }
    
    
}
