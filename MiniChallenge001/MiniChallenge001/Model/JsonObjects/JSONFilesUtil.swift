//
//  JSONFilesUtil.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 12/09/22.
//

import Foundation

class JSONFilesUtils {
    
    private static func getFilesURLFromFolder(folder name: String) -> [URL] {
        let paths = Bundle.main.paths(forResourcesOfType: "json", inDirectory: "/FilesJSON/\(name)")
        var urls: [URL] = []
        for path in paths {
            let temp = path.split(separator: "/")
            if let url = Bundle.main.url(forResource: "/FilesJSON/\(name)/\(temp[temp.count - 1])", withExtension: nil) {
                urls.append(url)
            }
        }
        return urls
    }
    
    public static func getDataFromFiles<T:Item>(folder name: String, decoder: T.Type) -> [Item] {
        let paths = getFilesURLFromFolder(folder: name)
        var items: [Item] = []
        for path in paths {
            do {
                let data = try Data(contentsOf: path)
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                items.append(decodedData)
            } catch {
                print("Error on path: \(path)")
            }
        }
        return items
    }
}

