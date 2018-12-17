//
//  ProductForView.swift
//  NanoChallengeAcademy
//
//  Created by Emanuel Jefferson Mendes Vasconcelos on 17/12/2018.
//  Copyright © 2018 Emanuel Jefferson Mendes Vasconcelos. All rights reserved.
//

import Foundation

struct ProductForView {
    var nome:String
    var precos: [String:Double]
    
    func menorPreco() -> (String,Double){
        let minValue = precos.min { a,b in a.value < b.value }
        
        return minValue ?? ("",0)
    }
}
