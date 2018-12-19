//
//  ProductForView.swift
//  NanoChallengeAcademy
//
//  Created by Emanuel Jefferson Mendes Vasconcelos on 17/12/2018.
//  Copyright © 2018 Emanuel Jefferson Mendes Vasconcelos. All rights reserved.
//

import Foundation

struct ProductForView {
//    var nome:String
    var precos: [Produto]
    
    func menorPreco() -> (String,Double,String){
        let minValue = precos.sorted { a ,b in a.preco < b.preco }
        
        return ((minValue.first?.estabelecimento)!, (minValue.first?.preco)!, (minValue.first?.data)!)
    }
}
