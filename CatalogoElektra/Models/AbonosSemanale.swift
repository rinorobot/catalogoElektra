//
//  AbonosSemanale.swift
//  CatalogoElektra
//
//  Created by Salvador Gómez Moya on 21/06/23.
//

import Foundation


struct AbonosSemanale: Decodable{
    let idPromocion: Int
    let montoAbono: Int
    let montoAbonoDigital: Int
    let montoDescuentoAbono: Int
    let montoDescuentoBanco: Int
    let montoDescuentoElektra: Int
    let montoFinalCredito: Int
    let montoUltimoAbono: Int
    let plazo: Int
    let precio: Int
}
