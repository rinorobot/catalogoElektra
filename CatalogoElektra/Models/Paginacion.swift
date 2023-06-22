//
//  Paginacion.swift
//  CatalogoElektra
//
//  Created by Salvador Gómez Moya on 21/06/23.
//

import Foundation

struct Paginacion: Decodable{
    let pagina: Int
    let totalPaginas: Int
    let totalRegistros: Int
    let totalRegistrosPorPagina: Int
}
