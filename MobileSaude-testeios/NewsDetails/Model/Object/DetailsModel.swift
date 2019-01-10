//
//  DetailsModel.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 08/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import Foundation


struct DetailsModel: Decodable {
    let ambiente: String?
    let autor: String?
    let categorias: [Int]?
    let categorias_nomes: [String]?

    let cod_operadora: String?
    let conteudo: String
    let data: String
    let data_validade: String?
    let exibir_titulo: String
    let formato: Int
    let foto_principal_url: String
    let galeria_arquivos: String?
    let galeria_fotos: String?
    let height_exibicao: String?
    let id: Int
    let idioma: String
    let permalink: String
    let podcast: String?
    let post_tipo_id: Int
    let sanfona: [String]?
    let status: String
    let tags: [String]?
    let tipo_exibicao: String?
    let titulo: String
    let video: String?
    let width_exibicao: String?
}

