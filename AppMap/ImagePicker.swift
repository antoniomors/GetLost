import SwiftUI
import UIKit
import CoreLocation
import MapKit
import CoreLocationUI
import PhotosUI
import Photos

// this picker is for taking picture and we have to add current position when the user take photo

struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    typealias SourceType = UIImagePickerController.SourceType
    
    let sourceType: SourceType
    let completionHandler: (UIImage?) -> Void
    @Binding var date: Date?
    @Binding var location: CLLocationCoordinate2D
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let viewController = UIImagePickerController()
        viewController.delegate = context.coordinator
        viewController.sourceType = sourceType
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(completionHandler: completionHandler)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ObservableObject {
        let completionHandler: (UIImage?) -> Void
        
        
        init(completionHandler: @escaping (UIImage?) -> Void) {
            self.completionHandler = completionHandler
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            let image: UIImage? = {
                if let image = info[.editedImage] as? UIImage {
                   
                    // here goes the current position request
                    print(info)
                    let date = Date()
                    return image
                    
                }
                print(info[.mediaMetadata])
                return info[.originalImage] as? UIImage
            }()
            completionHandler(image)
            
        }
        
        /// Save image to album.
        static func saveImageToAlbum(image: UIImage, completion: ( (Bool, PHAsset?) -> Void )? ) {
            let status = PHPhotoLibrary.authorizationStatus()
            
            if status == .denied || status == .restricted {
                completion?(false, nil)
                return
            }
            
            var placeholderAsset: PHObjectPlaceholder? = nil
            PHPhotoLibrary.shared().performChanges({
                let newAssetRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
                placeholderAsset = newAssetRequest.placeholderForCreatedAsset
            }) { (suc, error) in
                DispatchQueue.main.async {
                    if suc {
                        let asset = self.getAsset(from: placeholderAsset?.localIdentifier)
                        completion?(suc, asset)
                    } else {
                        completion?(false, nil)
                    }
                }
            }
        }
        
        private static func getAsset(from localIdentifier: String?) -> PHAsset? {
            guard let id = localIdentifier else {
                return nil
            }
            let result = PHAsset.fetchAssets(withLocalIdentifiers: [id], options: nil)
            if result.count > 0{
//                if let assetId = imageResult.assetIdentifier {
//                    let assetResults = PHAsset.fetchAssets(withLocalIdentifiers: [assetId], options: nil)
//                    DispatchQueue.main.async {
//                        self.parent.date = assetResults.firstObject?.creationDate
//                        if let coordinate  = assetResults.firstObject?.location?.coordinate {
//                            self.parent.location = coordinate
//                        }
//                    }
//                }
                print(result[0].creationDate)
                print(result[0].location)
                return result[0]
            }
            return nil
        }
        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            //            completionHandler(nil)
        }
    }
}


struct photoPic: Identifiable {
    var id = UUID()
    var imageT: UIImage
}

