//
//  JsonFileUtil.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 21/09/22.
//

import Foundation


class JsonFileUtil {
    
    private static let STANDARD_PATH = "Content"
    
    public static func getFilesNameFromFolder(folder path: String) -> [URL] {
        let folderPath = "\(STANDARD_PATH)/\(path)"
        guard let filesURL = Bundle.main.urls(forResourcesWithExtension: "json", subdirectory: folderPath) else { return [] }
        return filesURL
    }
    
    
}
