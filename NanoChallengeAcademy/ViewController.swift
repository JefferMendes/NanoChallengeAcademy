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
        
        //productTable.delegate = self
        //productTable.dataSource = self
        
//        let produto = Produto(context: CoreDataManager.context)
//
//        produto.nome = "Carne"
//        produto.estabelecimento = "carrefour"
//        produto.preco = 9
////
////
//        CoreDataManager.saveContext()
        
//        let fetchRequest: NSFetchRequest<Produto> = Produto.fetchRequest()
//
//        let fetch = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        
        
        let fetchRequest: NSFetchRequest<Produto> = Produto.fetchRequest()
//
        let consulta = "fo"

        let predicate1 = NSPredicate(format: "estabelecimento CONTAINS[cd] %@", consulta)
        let predicate2 = NSPredicate(format: "nome CONTAINS[cd] %@", consulta)

        let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate1,predicate2])

        fetchRequest.predicate = predicate
        
        var productList = try? CoreDataManager.context.fetch(fetchRequest)
        
        productList?.forEach({ (produto) in
            print(produto)
            print(produto.nome)
            print(produto.preco)
            print(produto.estabelecimento)

        })
        
        
        
//
//        print()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

