//
//  SaveNews.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 09/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import Foundation
import CoreData

class SaveNews {
    private var _noticias: Noticias!
    private var _context: NSManagedObjectContext!
    private let _delegate: AppDelegate!
    
    var noticias: Noticias {
        get {
            return self._noticias
        }
    }
    var context: NSManagedObjectContext {
        get {
            return self._context
        }
    }
    
    init() {
        self._delegate = AppDelegate()
        guard let context = self._delegate?.persistentContainer.viewContext else { return }
        self._context = context
    }
    
    
    
    func save() {
        do {
            try self._context.save()
        } catch let err {
            print(err)
        }
    }
    
    
    func deleFavorite(with id: Int) {
        
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Noticias")
            fetchRequest.predicate = NSPredicate(format: "id = %@", "\(id)")
            let objects = try(self.context.fetch(fetchRequest) as? [NSManagedObject])
            
            for object in objects! {
                context.delete(object)
            }
            
            try context.save()
        } catch let err {
            print(err)
        }
    }
    func fetchFavorite(by id: Int) -> [Noticias]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Noticias")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "data", ascending: false)]
        fetchRequest.predicate = NSPredicate(format: "id = %@", "\(id)")
        do {
            let fetch = try self._context.fetch(fetchRequest) as! [Noticias]
            return fetch
        } catch let err {
            print(err)
        }
        return nil
    }
    
    
    func fetchAllFavorite(completed: @escaping ([Noticias])->()) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Noticias")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "data", ascending: false)]
        do {
            let fetch = try self._context.fetch(fetchRequest) as! [Noticias]
            completed(fetch)
        } catch let err {
            print(err)
        }
    }
    
    func saveNews(with details: DetailsViewModel) {
        let new = NSEntityDescription.insertNewObject(forEntityName: "Noticias", into: self._context) as! Noticias
        new.titulo = details.titulo
        new.id = Int32(details.id)
        new.foto_principal_url = details.foto_principal_url
        new.conteudo = details.conteudo!
        new.categorias_nomes = details.categorias_nomes
        new.data = details.data
        save()
    }
    func saveNewsFavorite(with details: FavoriteDViewModel) {
        let new = NSEntityDescription.insertNewObject(forEntityName: "Noticias", into: self._context) as! Noticias
        new.titulo = details.titulo
        new.id = Int32(details.id)
        new.foto_principal_url = details.foto_principal_url
        new.conteudo = details.conteudo!
        new.categorias_nomes = details.categorias_nomes
        new.data = details.data
        save()
    }
}
