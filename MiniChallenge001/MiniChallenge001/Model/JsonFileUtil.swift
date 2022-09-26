//
//  JsonFileUtil.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 21/09/22.
//

import Foundation


class JsonFileUtil {
    
    private static let STANDARD_PATH = "Content"
    
    public static func getFilesURLFromFolder(folder name: String) -> [URL] {
        let folderPath = "\(STANDARD_PATH)/\(name)"
        guard let filesURL = Bundle.main.urls(forResourcesWithExtension: "json", subdirectory: folderPath) else { return [] }
        return filesURL
    }
    
    public static func getDataFromFiles<T:Json>(folder name: FolderName, decoder: T.Type) -> [Json] {
        let urls = getFilesURLFromFolder(folder: name.rawValue)
        var items: [Json] = []
        for url in urls {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                items.append(decodedData)
            } catch {
                print("Error on path: \(url)")
            }
        }
        return items
    }
}

public enum FolderName: String {
    case arma = "arma"
    case armaduras = "armaduras"
    case bugiganga = "bugiganga"
    case caracterisca = "caracteristica"
    case equipamento = "equipamento"
    case ferramenta = "ferramenta"
    case fichas = "fichas"
    case itemMontaria = "item-montaria"
    case magia = "magia"
    case montaria = "montaria"
    case trait = "trait"
    case veiculo = "veiculo"
}
