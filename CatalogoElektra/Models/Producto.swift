//
//  Producto.swift
//  CatalogoElektra
//
//  Created by Salvador Gómez Moya on 21/06/23.
//

import Foundation


struct Producto: Decodable{
    let abonosSemanales: [AbonosSemanale]
    let codigoCategoria: String
    let descuento: Bool
    let disponibleCredito: Bool
    let id: String
    let idLinea: Int
    let idModalidad: Int
    let lineaCredito: String
    let montoDescuento: Double
    let nombre: String
    let pagoSemanalPrincipal: Int
    let plazoPrincipal: Int
    let porcentajeDescuento: Double
    let precioCredito: Double
    let precioFinal: Double
    let precioRegular: Int
    let relevancia: Int
    let sku: String
    let urlImagenes: [String]
}
