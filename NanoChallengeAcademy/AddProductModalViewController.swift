//
//  AddProductModalViewController.swift
//  NanoChallengeAcademy
//
//  Created by Jafer Daltro Pompeu Júnior on 14/12/2018.
//  Copyright © 2018 Emanuel Jefferson Mendes Vasconcelos. All rights reserved.
//

import UIKit

class AddProductModalViewController: UIViewController {
    
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var placeTxtField: UITextField!
    @IBOutlet weak var priceTxtField: UITextField!
    
    @IBAction func sendProduct(_ sender: Any) {
        //Funcao para enviar os dados das text fields para o coredata
        //Lembrar de pegar a data da ação!
        let produto = Produto(context: CoreDataManager.context)
        
        produto.nome = nameTxtField.text
        produto.estabelecimento = placeTxtField.text
        if let price = priceTxtField.text {
            produto.preco = Double(price)!
        }
//        produto.preco = priceTxtField.text
        
        CoreDataManager.saveContext()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        //Dismiss no modal
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
