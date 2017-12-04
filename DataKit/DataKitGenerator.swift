//
//  DataKitGenerator.swift
//  DataKit
//
//  Created by Jean on 01/12/2017.
//  Copyright © 2017 Jean. All rights reserved.
//

import Foundation


public extension UIImageView {
    
    public func downloadImage(url: URL) {
        guard let data = try? Data(contentsOf: url) else { return }
        self.image = UIImage(data: data)
    }
 
    
    public func downloadImageAsync(url: URL) {
        URLSession.shared.dataTask(with: url, completionHandler:
            { [weak self] (data, response, error) -> Void in
                
                if error != nil {
                    print(error ?? "Error in imageFromServerURL")
                    return
                }
                DispatchQueue.main.async(execute: { [weak self] () -> Void in
                    let image = UIImage(data: data!)!
                    self?.image = image
                })
                
        }).resume()
    }
}

fileprivate func randomImageUrl() -> String {
    return "https://picsum.photos/\(arc4random_uniform(900) + 100)/?random"
}

open class Objeto {
    
    
    public let nome: String
    public let subtitulo: String
    public let descricao: String
    public let url: String
    public var image: UIImageView = UIImageView()
    
    public init(nome: String, subtitulo: String, descricao: String, url: String) {
        self.nome = nome
        self.subtitulo = subtitulo
        self.descricao = descricao
        self.url = url
        
        if url != "" {

            self.image.downloadImageAsync(url: URL(string: randomImageUrl())!)
            
            //self.image.downloadImageAsync(url: URL(string: url)!)
            //self.image.downloadImage(url: URL(string: url)!)
            
        }
        
    }
}

public func generateObjetos(sections: Int, rows: Int) -> [Int: [Objeto]] {
    var dict = [Int: [Objeto]]()
    let dataStore = DataStore()
    
    for i in 0..<sections {
        var array = [Objeto]()
        for _ in 0..<rows {
            let value: Objeto = dataStore.randomEstadioCidades()
            
            array.append(value)
        }
        dict[i] = array
    }
    return dict
}

public func normalizedRandom() -> Float {
    return Float(arc4random()) / Float(UINT32_MAX)
}
