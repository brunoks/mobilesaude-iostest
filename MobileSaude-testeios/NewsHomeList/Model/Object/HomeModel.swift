//
//  HomeModel.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 08/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import Foundation


struct HomeModel: Decodable {
    let categorias: [Int]?
    let categorias_nomes: [String]?
    let cod_operadora: Int?
    let conteudo: String?
    let data: String?
    let data_publicacao: String?
    let data_validade: String?
    let formato: Int?
    let foto_principal_url: String?
    let id: Int?
    let permalink: String?
    let post_tipo_id: Int?
    let sumario: String?
    let titulo: String?
}
