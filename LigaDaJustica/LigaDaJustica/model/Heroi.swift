//
//  Heroi.swift
//  LigaDaJustica
//
//  Created by IFPB on 21/07/2018.
//  Copyright © 2018 IFPB. All rights reserved.
//

import Foundation

class Heroi: NSObject, NSCoding {
    var nome: String!
    var imgUrl: String!
    var nota: Int!
    var poder: Bool!
    
    override var description: String{
        return self.nome!
    }
    
    // construtor memória
    init(nome: String, imgUrl: String, nota: Int, poder: Bool) {
        self.nome = nome
        self.imgUrl = imgUrl
        self.nota = nota
        self.poder = poder
    }
    
    // construtor arquivo
    required init?(coder aDecoder: NSCoder) {
        self.nome = aDecoder.decodeObject(forKey: "nome") as! String
        self.imgUrl = aDecoder.decodeObject(forKey: "imgUrl") as! String
        self.nota = aDecoder.decodeObject(forKey: "nota") as! Int
        self.poder = aDecoder.decodeObject(forKey: "poder") as! Bool
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.nome, forKey: "nome")
        aCoder.encode(self.imgUrl, forKey: "imgUrl")
        aCoder.encode(self.nota, forKey: "nota")
        aCoder.encode(self.poder, forKey: "poder")
    }
}
