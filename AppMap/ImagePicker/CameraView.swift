//
//  CameraView.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 15/06/22.
//

import Foundation
import UIKit
import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    typealias SourceType = UIImagePickerController.SourceType
    let sourceType: SourceType
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresentingImagePicker: Bool
    @Binding var selectedImage: UIImage?
    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        viewController.delegate = context.coordinator
        viewController.sourceType = sourceType
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> CameraView.Coordinator {
        return Coordinator(self, isPresentingImagePicker: $isPresentingImagePicker) { image in
            self.selectedImage = image
        }
    }
}

extension CameraView {
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraView
        @Binding var isPresentingImagePicker: Bool
        let onFetchImage: (UIImage) -> Void
        
        init(_ parent: CameraView, isPresentingImagePicker: Binding<Bool>, onFetchImage: @escaping (UIImage) -> Void) {
            self.parent = parent
            self._isPresentingImagePicker = isPresentingImagePicker
            self.onFetchImage = onFetchImage
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isPresentingImagePicker  = false
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                onFetchImage(image)
                isPresentingImagePicker.toggle()
            }
        }
    }
}
