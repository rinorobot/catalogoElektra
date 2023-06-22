//
//  DataCatalog.swift
//  CatalogoElektra
//
//  Created by Salvador Gómez Moya on 21/06/23.
//

import Foundation

struct DataCatalog: Decodable{
    let advertencia: String
    let codigo: String
    let folio: String
    let mensaje: String
    let resultado: Resultado
    
    
}
