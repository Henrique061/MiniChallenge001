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
            if let url = Bundle.main.url(forResource: "FilesJSON/\(name)/\(temp[temp.count - 1])", withExtension: nil) {
                urls.append(url)
            }
        }
        return urls
    }
    
    public static func getDataFromFiles<T:CustomItem>(folder name: String, decoder: T.Type) -> [CustomItem] {
        let paths = getFilesURLFromFolder(folder: name)
        var items: [CustomItem] = []
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
    
    public static func getDataFromFolders<T:CustomItem>(folderDecoder: [(String, T.Type)]) -> [CustomItem] {
        var allItems: [CustomItem] = []
        for folder in folderDecoder {
            allItems = allItems + getDataFromFiles(folder: folder.0, decoder: folder.1)
        }
        return allItems
    }
}

