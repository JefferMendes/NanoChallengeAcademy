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
            
            if let element = productList.firstIndex(where: { (p) -> Bool in
                produto.nome == p.precos.first?.nome
            }) {
                productList[element].precos.append(produto)
            } else {
                let product = ProductForView(precos: [produto])
                productList.append(product)
            }
        })
        
        return productList
    }
}
