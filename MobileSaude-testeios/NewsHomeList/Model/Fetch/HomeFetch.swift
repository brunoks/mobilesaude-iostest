//
//  HomeFetch.swift
//  MobileSaude-testeios
//
//  Created by Mac Novo on 08/01/19.
//  Copyright © 2019 Bruno iOS Dev. All rights reserved.
//

import Foundation


class HomeFetch {
    
    func willStartHomeFetch<I: Decodable>(completed: @escaping (Array<I>) -> ()) {
        
        let url = "http://mobilesaude.com.br/challenge/lista.json"
        BrunoFire.request(url) { (response) in
            do {
                let json = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments)
                print(json)
            } catch let err{
                print(err)
            }
            do {
                let feed = try JSONDecoder().decode(Array<I>.self, from: response)
                DispatchQueue.main.async {
                    completed(feed)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
