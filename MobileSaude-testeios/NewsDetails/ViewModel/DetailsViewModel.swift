//
//  DetailsViewModel.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 08/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import UIKit

struct DetailsViewModel {

    let categorias_nomes: String
    
    let conteudo: String?
    let data: String
    let foto_principal_url: String
    let id: Int
    let titulo: String
    
    init(model: DetailsModel) {
        self.conteudo = model.conteudo.html2String
        self.data = model.data
        self.foto_principal_url = model.foto_principal_url
        self.id = model.id
        self.titulo = model.titulo
        
        if let category = model.categorias_nomes?.first {
            self.categorias_nomes = category
        } else {
            self.categorias_nomes = "Notícias"
        }
    }
    
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
