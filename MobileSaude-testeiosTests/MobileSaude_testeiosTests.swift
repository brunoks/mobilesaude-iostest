//
//  MobileSaude_testeiosTests.swift
//  MobileSaude-testeiosTests
//
//  Created by Mac Novo on 08/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//
import Foundation
import XCTest
@testable import MobileSaude_testeios

class MobileSaude_testeiosTests: XCTestCase {

    var app: UIApplication!
    
    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testHomeViewModel() {
        
        let date = "20/05/2019"
        let newmodel = HomeModel(categorias: [],
                                 categorias_nomes: ["Notíticias"],
                                 cod_operadora: 0,
                                 conteudo: "Same Text",
                                 data: date,
                                 data_publicacao: date,
                                 data_validade: date,
                                 formato: 0,
                                 foto_principal_url: "url",
                                 id: 0,
                                 permalink: "url2",
                                 post_tipo_id: 0,
                                 sumario: "",
                                 titulo: "titulo")
        
        
        let newvmodel = HomeViewModel(model: newmodel)
        
        XCTAssertEqual(newmodel.titulo, newvmodel.titulo)
        XCTAssertEqual(newmodel.categorias_nomes?.first, newvmodel.categorias_nomes)
        XCTAssertEqual(newmodel.conteudo, newvmodel.conteudo)
        XCTAssertEqual(newmodel.data, newvmodel.data)
        XCTAssertEqual(newmodel.foto_principal_url, newvmodel.foto_principal_url)
    }
    
    
    
    func testFavoriteViewModel() {
        
        let save = SaveNews()
        let details = DetailsModel(ambiente: "", autor: "", categorias: [0], categorias_nomes: ["News"], cod_operadora: "", conteudo: "same content", data: "20/05/2019", data_validade: "", exibir_titulo: "", formato: 0, foto_principal_url: "urlurl", galeria_arquivos: "", galeria_fotos: "", height_exibicao: "", id: 123, idioma: "", permalink: "", podcast: "", post_tipo_id: 0, sanfona: [], status: "", tags: [], tipo_exibicao: "", titulo: "News new", video: "", width_exibicao: "")
        
        let detailsvmodel = DetailsViewModel(model: details)
        save.saveNews(with: detailsvmodel)
        
        let noticias = save.fetchFavorite(by: detailsvmodel.id)
        guard let noticia = noticias?.first else { return }
        let newmodel = FavoriteModel(notificias: noticia)
        
        
        let newvmodel = FavoriteViewModel(model: newmodel)
        
        XCTAssertEqual(newmodel.titulo, newvmodel.titulo)
        XCTAssertEqual(newmodel.categorias_nomes, newvmodel.categorias_nomes)
        XCTAssertEqual(newmodel.conteudo, newvmodel.conteudo)
        XCTAssertEqual(newmodel.data, newvmodel.data)
        XCTAssertEqual(newmodel.foto_principal_url, newvmodel.foto_principal_url)
    }

}
