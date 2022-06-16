//
//  DeriveView.swift
//  GetLost
//
//  Created by Antonio Amoroso on 20/05/22.
//

import SwiftUI
import MapKit


struct DeriveView: View {

    // animation

    @State private var isRotated = false
    var animation: Animation {
        Animation.easeOut
            .repeatForever(autoreverses: true)
    }

    @State var image = UIImage()
    //    sheetty
    @State private var showSheet: Bool = false
    @State private var showLibrary: Bool = false

    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State var selection: String? = nil

    @State var selectedIndex: Int = 0

    @State private var showImagePicker: Bool = false
    @State var rootIsActive: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                ZStack{

                    Image("logoIntro")
                        .offset(x: 0, y: -100)

                    Button(action: {
                        rootIsActive = false
                    }, label: {
                        NavigationLink(destination: photoView(rootIsActive: $rootIsActive), isActive: $rootIsActive) {
                            Text("+")
                                .offset(x: 5, y: -110)
                        }
                    })
                }
                .font(.system(size: 170))
                .foregroundColor(.white)
                //                .padding(.bottom, 210)
                .padding(.leading)
                .padding(.trailing, 10)

                Text("By tapping on the plus symbol\nyou will be able to add your records")
                    .font(.system(size: 20))
                    .padding([.trailing, .leading])
            }
        }
    }
}

struct DeriveView_Previews: PreviewProvider {
    static var previews: some View {
        DeriveView()
    }
}

// navigation view link
struct photoView: View {
    @StateObject var viewModel = ViewModel()
    @Binding var rootIsActive: Bool

    @ViewBuilder

    // to see the image in the screen
    func imageView(for image: UIImage?) -> some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
        }
        else {
            Text("No Image Selected")
                .padding()
        }
    }

    // this is for the 2 buttons
    func controlBar() -> some View {
        HStack(spacing: 32) {
            Button(action:
                    viewModel.choosePhoto
                   , label: {
                Text("Choose Photo")
            })
            Button(action: viewModel.takePhoto, label: {
                Text("Take Photo")
            })
        }.padding()
    }

    var body: some View {

        VStack {
            imageView(for: viewModel.selectedImage)
            if viewModel.selectedImage == nil {
                controlBar()
            } else {

                Button(action: {
                    
                }, label: {
                    NavigationLink(
                        destination: SenseView(
                            rootIsActive: $rootIsActive,
                            image: viewModel.selectedImage,
                            location: viewModel.selectedLocation
                        )
                    ) { Text("Use Photo")
                    }
                })
            }

        }.navigationBarHidden(true)
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $viewModel.isPresentingImagePicker, content: {
                if viewModel.sourceType == .camera {
                    CameraView(sourceType: viewModel.sourceType, isPresentingImagePicker: $viewModel.isPresentingImagePicker, selectedImage: $viewModel.selectedImage)
                } else if viewModel.sourceType == .photoLibrary {
                    CustomPhotoPickerView(selectedImage: $viewModel.selectedImage, date: $viewModel.date, location: $viewModel.selectedLocation)
                }
            })
    }
}

// image picker model

class ViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var isPresentingImagePicker = false
    @Published var date: Date?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 20.0,
            longitude: 20.0),
        latitudinalMeters: .init(10000),
        longitudinalMeters: .init(10000))

    @Published var selectedLocation: CLLocationCoordinate2D? = nil

    //    private(set) var sourceType: ImagePicker.SourceType = .camera
    private(set) var sourceType: CameraView.SourceType = .camera


    func choosePhoto() {
        sourceType = .photoLibrary
        isPresentingImagePicker = true
    }

    func takePhoto() {
        sourceType = .camera
        isPresentingImagePicker = true
    }

    func didSelectImage(_ image: UIImage?) {
        selectedImage = image
        isPresentingImagePicker = false


    }
}
