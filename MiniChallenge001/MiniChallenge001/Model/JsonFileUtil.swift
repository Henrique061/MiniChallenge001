//
//  JsonFileUtil.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 21/09/22.
//

import Foundation


class JsonFileUtil {
    
    private static let STANDARD_PATH = "Content"
    
    public static var DOCUMENTS_PATH: URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0]
            .appendingPathComponent(".inventure").appendingPathComponent("sheets")
    }
    
    public static func getFilesURLFromBundle(folder name: String) -> [URL] {
        let folderPath = "\(STANDARD_PATH)/\(name)"
        guard let filesURL = Bundle.main.urls(forResourcesWithExtension: "json", subdirectory: folderPath) else { return [] }
        return filesURL
    }
    
    public static func getDataFromBundle<T:Json>(folder name: BundleFolderName, decoder: T.Type) -> [Json] {
        let urls = getFilesURLFromBundle(folder: name.rawValue)
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
    
    private static func createSheetsFolderPath() throws {
        if !DOCUMENTS_PATH.hasDirectoryPath {
            try FileManager.default.createDirectory(at: DOCUMENTS_PATH, withIntermediateDirectories: true)
        }
    }
    
    public static func getNewIdForSheet() throws -> Int {
        try createSheetsFolderPath()
        var id = 1
        let arr = try FileManager.default.contentsOfDirectory(atPath: DOCUMENTS_PATH.path)
        while true {
            id = Int.random(in: 1...5000)
            var isValidID = true
            for fileName in arr {
                if fileName.contains("\(id)") {
                    isValidID = false
                }
            }
            if isValidID { break }
        }
        return id
    }
    
    private static func formatSheetName(name: String, id: Int) -> String {
        return "\(name)%\(id)".lowercased().replacingOccurrences(of: " ", with: "_")
    }
    
    public static func write<T:Json>(content: T) throws {
        try createSheetsFolderPath()
        let encodedContent = try JSONEncoder().encode(content)
        let fileName = formatSheetName(name: content.nome, id: content.id)
        let url = DOCUMENTS_PATH.appendingPathComponent(fileName).appendingPathExtension("json")
        FileManager.default.createFile(atPath: url.path,contents: encodedContent)
    }
    
    public static func delete<T:Json>(content: T) throws {
        let fileName = formatSheetName(name: content.nome, id: content.id)
        let completePath = DOCUMENTS_PATH.appendingPathComponent(fileName).appendingPathExtension("json")
        try FileManager.default.removeItem(atPath: completePath.path)
    }
    
    public static func getAllSheets() throws -> [PersonagemFicha] {
        let sheetsPath = try FileManager.default.contentsOfDirectory(atPath: DOCUMENTS_PATH.path)
        var sheetsArr: [PersonagemFicha] = []
        for fileName in sheetsPath {
            if fileName.contains(".DS_Store") { continue }
            let completePath = DOCUMENTS_PATH.appendingPathComponent(fileName)
            if let data = FileManager.default.contents(atPath: completePath.path) {
                do {
                    let decodedContent = try JSONDecoder().decode(PersonagemFicha.self, from: data)
                    sheetsArr.append(decodedContent)
                } catch {
                    continue
                }
            }
        }
        return sheetsArr
    }
}

public enum DocumentsFolderName: String {
    case sheets = "sheets"
}

public enum BundleFolderName: String, Codable {
    case arma = "arma"
    case armaduras = "armaduras"
    case bugiganga = "bugiganga"
    case caracterisca = "caracteristica"
    case equipamento = "equipamento"
    case ferramenta = "ferramenta"
    case itemMontaria = "item-montaria"
    case magia = "magia"
    case montaria = "montaria"
    case trait = "trait"
    case veiculo = "veiculo"
    
    case none = "Nenhum"
}
