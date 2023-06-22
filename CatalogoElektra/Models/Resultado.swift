//
//  Resultado.swift
//  CatalogoElektra
//
//  Created by Salvador Gómez Moya on 21/06/23.
//

import Foundation

struct Resultado: Decodable{
    let categoria: String
    let paginacion: Paginacion
    let productos: [Producto]
}
