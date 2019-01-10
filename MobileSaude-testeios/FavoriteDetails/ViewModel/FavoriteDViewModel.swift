//
//  FavoriteDViewModel.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 09/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

struct FavoriteDViewModel {
    
    let categorias_nomes: String
    
    let conteudo: String?
    let data: String
    let foto_principal_url: String
    let id: Int
    let titulo: String
    
    init(model: Noticias) {
        self.conteudo = model.conteudo!.html2String
        self.data = model.data!
        self.foto_principal_url = model.foto_principal_url!
        self.id = Int(model.id)
        self.titulo = model.titulo!
        
        self.categorias_nomes = model.categorias_nomes!
    }
    
}
