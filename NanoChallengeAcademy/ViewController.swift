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
    
    var productList = [ProductForView]() {
        didSet {
            self.productTable.reloadData()
            print("ACHOU")
            print(productList.count)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTable.delegate = self
        productTable.dataSource = self
        
        
        
        /*** Codigos para Teste do coreData ***/
        
        /* Criação e Inserção */
        
//        let produto = Produto(context: CoreDataManager.context)
//
//        produto.nome = "Arroz"
//        produto.estabelecimento = "Extra"
//        produto.preco = 2
//
//
//        CoreDataManager.saveContext()
//
        /* Inicio da Busca */
        
        var fetchRequest: NSFetchRequest<Produto> = Produto.fetchRequest()
        
        /* Filtro da Busca */
        
//        let consulta = "Carre"
//
//        let predicate1 = NSPredicate(format: "estabelecimento CONTAINS[cd] %@", consulta)
//        let predicate2 = NSPredicate(format: "nome CONTAINS[cd] %@", consulta)
//
//        let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate1,predicate2])
//
//        fetchRequest.predicate = predicate
        
        /* Deleção */
        
//        let fetch = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
//
//        var productListDeleted = try? CoreDataManager.context.execute(fetch)
        
        /* Requisição */
        
        var products = try? CoreDataManager.context.fetch(fetchRequest)
//
        products?.forEach({ (produto) in
            //print(produto)
            print(produto.nome)
            print(produto.preco)
            print(produto.estabelecimento)
            
            if let element = productList.firstIndex(where: { (p) -> Bool in
                produto.nome == p.nome
            }) {
                print(element)
                productList[element].precos[produto.estabelecimento!] = produto.preco
            } else {
                print(false)
                print(produto)
                let product = ProductForView(nome:produto.nome!, precos: [produto.estabelecimento!:produto.preco])
                productList.append(product)
            }
            
            print(productList)
        })
        
        /*** Fim dos codigos de teste ***/
        
//        var productList = [ProductForView]()
//
//        let product = ProductForView(nome: "Arroz", precos: ["S":5,"B":2,"C":3])
//
//        print(product.menorPreco())
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

