//
//  ImagePicker.swift
//  MiniChallenge001
//
//  Created by Matheus Cavalcanti de Arruda on 10/10/22.
//

import Foundation
import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    private var completion: (_ image: UIImage?) -> Void
    
    public init(completion: @escaping (_ image: UIImage?) -> Void) {
        self.completion = completion
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _image in
                    self.parent.completion(image as? UIImage)
                }
            }
        }
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
