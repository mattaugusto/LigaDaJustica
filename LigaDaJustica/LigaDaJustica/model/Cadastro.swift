//
//  Cadastro.swift
//  LigaDaJustica
//
//  Created by IFPB on 21/07/2018.
//  Copyright © 2018 IFPB. All rights reserved.
//

import Foundation

class Cadastro: NSObject, NSCoding {
    var lista: Array<Heroi>!
    
    // construtor memória
    override init() {
        self.lista = Array<Heroi>()
    }
    
    // construtor arquivo
    required init?(coder aDecoder: NSCoder) {
        self.lista = aDecoder.decodeObject(forKey: "lista") as! Array<Heroi>
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.lista, forKey: "lista")
    }
    
    func add(heroi: Heroi) {
        self.lista.append(heroi)
    }
    
    func count() -> Int {
        return self.lista.count
    }
    
    func get(index: Int) -> Heroi {
        return self.lista[index]
    }
    
    func del(index: Int) {
        self.lista.remove(at: index)
    }
    
    func swap(origem: Int, destino: Int) {
        let heroi = self.lista[origem]
        self.lista[origem] = self.lista[destino]
        self.lista[destino] = heroi
    }
    
    func update(index: Int, heroi: Heroi) {
        self.lista[index] = heroi
    }
}
