//
//  FavoriteModel.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 09/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import Foundation

struct FavoriteModel {
    let categorias_nomes: String?
    let conteudo: String?
    let data: String?
    let foto_principal_url: String?
    let id: Int?
    let titulo: String?
    
    init(notificias: Noticias) {
        self.categorias_nomes = notificias.categorias_nomes
        self.conteudo = notificias.conteudo
        self.data = notificias.data
        self.foto_principal_url = notificias.foto_principal_url
        self.id = Int(notificias.id)
        self.titulo = notificias.titulo
    }
}
