//
//  HomeViewModel.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 08/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import UIKit
import SDWebImage
struct HomeViewModel {
    let categorias: [Int]
    let categorias_nomes: String
    let cod_operadora: Int
    let conteudo: String
    let data: String
    let data_publicacao: String
    let data_validade: String?
    let formato: Int
    let foto_principal_url: String
    let id: Int
    let permalink: String
    let post_tipo_id: Int
    let sumario: String?
    let titulo: String

    
    init(model: HomeModel) {
        self.categorias = model.categorias!
        self.cod_operadora = model.cod_operadora!
        self.conteudo = model.conteudo!
        self.data = model.data!
        self.data_publicacao = model.data_publicacao!
        self.data_validade = model.data_validade
        self.formato = model.formato!
        self.foto_principal_url = model.foto_principal_url!
        self.id = model.id!
        self.permalink = model.permalink!
        self.post_tipo_id = model.post_tipo_id!
        self.sumario = model.sumario
        self.titulo = model.titulo!
        
        if let category = model.categorias_nomes?.first {
            self.categorias_nomes = category
        } else {
            self.categorias_nomes = "Notícias"
        }
        
    }
}
