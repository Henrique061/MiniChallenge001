//
//  JsonFileUtil.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 21/09/22.
//

import Foundation


class JsonFileUtil {
    
    private static let STANDARD_PATH = "Content"
    
    public static func getFilesURLFromFolder(folder path: String) -> [URL] {
        let folderPath = "\(STANDARD_PATH)/\(path)"
        guard let filesURL = Bundle.main.urls(forResourcesWithExtension: "json", subdirectory: folderPath) else { return [] }
        return filesURL
    }
    
    public static func getDataFromFiles<T:Json>(folder name: String, decoder: T.Type) -> [Json] {
        let paths = getFilesURLFromFolder(folder: name)
        var items: [Json] = []
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
