//
//  FavoriteViewModel.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 09/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import UIKit

struct FavoriteViewModel {
    let categorias_nomes: String
    let conteudo: String
    let data: String
    let foto_principal_url: String
    let id: Int
    let titulo: String
    
    
    init(model: FavoriteModel) {
        self.categorias_nomes = model.categorias_nomes!
        self.conteudo = model.conteudo!
        self.data = model.data!
        self.foto_principal_url = model.foto_principal_url!
        self.id = model.id!
        self.titulo = model.titulo!
        
    }
}
