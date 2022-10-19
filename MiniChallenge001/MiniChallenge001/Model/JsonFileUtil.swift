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
    
    public static func getDataFromBundle<T:Json>(folder name: BundleFolderName, decoder: T.Type) -> [any Json] {
        let urls = getFilesURLFromBundle(folder: name.rawValue)
        var items: [any Json] = []
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
        let arr = try FileManager.default.contentsOfDirectory(atPath: DOCUMENTS_PATH.path)
        if arr.isEmpty {
            return 1
        }
        
        var id = 1
        
        for i in arr {
            let temp = Int(i.split(separator: ".")[0]) ?? id
            if id <= temp { id = temp + 1 }
        }
        
        return id
    }
    
    private static func formatSheetName(name: String, id: Int) -> String {
        return "\(id)".lowercased().replacingOccurrences(of: " ", with: "-")
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
            print(completePath.path)
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

public enum BundleFolderName: String, Codable, Hashable {
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
    
    case pacote = "pacote"
    case none = "Nenhum"
}
