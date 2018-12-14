//
//  DescriptionVCExtension.swift
//  NanoChallengeAcademy
//
//  Created by Bruno Marques Monteiro on 14/12/2018.
//  Copyright © 2018 Emanuel Jefferson Mendes Vasconcelos. All rights reserved.
//

import Foundation
import UIKit

extension DescriptionViewController: UITableViewDelegate, UITableViewDataSource {
//    uma extension nao pode conter variaveis no escopo, adicionei direto na funcao que faz o swipe, talvez nao de certo. Caso nao de, juntar a extension com a DescriptionViewController no mesmo arquivo
//    var editTxtField: UITextField?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        var editTxtField: UITextField?
        let editPrice = UITableViewRowAction(style: .default, title: "Editar", handler: {(action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            let alertController = UIAlertController(title: nil, message: "Digite o novo preço", preferredStyle: .alert)
            let send = UIAlertAction(title: "Enviar", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
                
                if let userInput = editTxtField!.text {
                    //Inserir funcao para enviar para o preco para o coredata
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
