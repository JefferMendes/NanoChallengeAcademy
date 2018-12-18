//
//  Searches.swift
//  NanoChallengeAcademy
//
//  Created by Jafer Daltro Pompeu Júnior on 14/12/2018.
//  Copyright © 2018 Emanuel Jefferson Mendes Vasconcelos. All rights reserved.
//

import Foundation
import CoreData
struct Searches {
    let contexto: NSManagedObjectContext
    
    init(contexto: NSManagedObjectContext) {
        self.contexto = contexto
    }
    
    static func buscaCoreData(consulta: String) -> [ProductForView]{
        let fetchRequest: NSFetchRequest<Produto> = Produto.fetchRequest()
        
        if consulta != "" {
            let predicate1 = NSPredicate(format: "estabelecimento CONTAINS[cd] %@", consulta)
            let predicate2 = NSPredicate(format: "nome CONTAINS[cd] %@", consulta)

            let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate1,predicate2])

            fetchRequest.predicate = predicate
        }
        
        let products = try? CoreDataManager.context.fetch(fetchRequest)
        var productList = [ProductForView]()
        products?.forEach({ (produto) in
            //print(produto)
            //print(produto.nome)
            //print(produto.preco)
            //print(produto.estabelecimento)
            
            if let element = productList.firstIndex(where: { (p) -> Bool in
                produto.nome == p.nome
            }) {
                //print(element)
                productList[element].precos[produto.estabelecimento!] = produto.preco
            } else {
                //print(false)
                //print(produto)
                let product = ProductForView(nome:produto.nome!, precos: [produto.estabelecimento!:produto.preco])
                productList.append(product)
            }
            
            //print(productList)
        })
        
        return productList
    }
}
