//
//  DataStore.swift
//  DataKit
//
//  Created by Jean on 04/12/2017.
//  Copyright © 2017 Jean. All rights reserved.
//

import Foundation

public class DataStore{
    
    
    private func randomDescription(key: String) -> String {
        
        let strs = [
            "Estádio Lujniki":"Moscou(Moscovo)",
            "Arena Otkrytie":"Moscou(Moscovo)",
            "Estádio Krestovsky":"São Petersburgo",
            "Estádio de Kaliningrado":"Kaliningrado",
            "Arena Kazan":"Cazã",
            "Estádio de Níjni Novgorod":"Níjni Novgorod",
            "Estádio de Samara":"Samara",
            "Arena Volgogrado":"Volgogrado",
            "Arena Mordovia":"Saransk",
            "Arena Rostov":"Rostov do Don",
            "Estádio Olímpico de Fisht":"Sóchi",
            "Estádio Central":"Ecaterimburgo"
        ]
        
        return strs[key]!
    }
    public func randomEstadioCidades() -> Objeto {
        
        let strs = [
            "Estádio Lujniki":"Moscou(Moscovo)",
            "Arena Otkrytie":"Moscou(Moscovo)",
            "Estádio Krestovsky":"São Petersburgo",
            "Estádio de Kaliningrado":"Kaliningrado",
            "Arena Kazan":"Cazã",
            "Estádio de Níjni Novgorod":"Níjni Novgorod",
            "Estádio de Samara":"Samara",
            "Arena Volgogrado":"Volgogrado",
            "Arena Mordovia":"Saransk",
            "Arena Rostov":"Rostov do Don",
            "Estádio Olímpico de Fisht":"Sóchi",
            "Estádio Central":"Ecaterimburgo"
        ]
        let r = arc4random_uniform(UInt32(strs.count))
        var count: Int = 0
        for (key, value) in strs{
            if count == Int(r){
                return Objeto(nome: key, subtitulo: value, descricao: randomDescription(key: key), url: returnURLEstadio(key: key))
            }
            count += 1
        }
        return Objeto(nome: "", subtitulo: "", descricao: "", url: randomImageUrl())
    }
    
    private func returnURLEstadio(key: String) -> String {
        
        let strs = [
            "Estádio Lujniki":"https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Luzhniki_Stadium1.jpg/1024px-Luzhniki_Stadium1.jpg",
            "Arena Otkrytie":"https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Stadium_Spartak_in_Moscow.jpg/1024px-Stadium_Spartak_in_Moscow.jpg",
            "Estádio Krestovsky":"https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/RUS-2016-Aerial-SPB-Krestovsky_Stadium_01.jpg/1024px-RUS-2016-Aerial-SPB-Krestovsky_Stadium_01.jpg",
            "Estádio de Kaliningrado":"https://upload.wikimedia.org/wikipedia/commons/c/ce/Kalingrado_stadium.jpg",
            "Arena Kazan":"https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Kazan_Arena_08-2016.jpg/200px-Kazan_Arena_08-2016.jpg",
            "Estádio de Níjni Novgorod":"https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Nizhny_Novgorod_Stadium.jpg/200px-Nizhny_Novgorod_Stadium.jpg",
            "Estádio de Samara":"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Самара_Арена_в_ноябре_2017.jpg/200px-Самара_Арена_в_ноябре_2017.jpg",
            "Arena Volgogrado":"https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Волгоград_Арена.jpg/200px-Волгоград_Арена.jpg",
            "Arena Mordovia":"https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Мордовия_Арена.jpg/200px-Мордовия_Арена.jpg",
            "Arena Rostov":"https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/ArenaRostov.jpg/200px-ArenaRostov.jpg",
            "Estádio Olímpico de Fisht":"https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Fisht_Olympic_Stadium_2017.jpg/200px-Fisht_Olympic_Stadium_2017.jpg",
            "Estádio Central":"https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Ekaterinburg_Arena_Russia.jpg/200px-Ekaterinburg_Arena_Russia.jpg"
        ]
        return strs[key]!
    }
    
    public func randomImageUrl() -> String {
        return "https://picsum.photos/\(arc4random_uniform(900) + 100)/?random"
    }
}
