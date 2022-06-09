//
//  DeriveView.swift
//  GetLost
//
//  Created by Antonio Amoroso on 20/05/22.
//

import SwiftUI

struct DeriveView: View {
    @State private var showSheet: Bool = false
    @State private var showLibrary: Bool = false
    @State private var showRecord: Bool = false
    @State var createN: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State var image = UIImage()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack{

                    Image("logoIntro")
                        .offset(x: 0, y: -100)

                    Menu("+") {

                        Button(action: {
                            self.showRecord = true

                            print("pressed")

                        }, label: {
                            Label("Audio", systemImage: "mic")
                        })

                        Button(action: {
                            self.showSheet = true
                            self.showLibrary = true

                        }, label: {
                            Label("Photo", systemImage: "camera")
                        })

                        Button(action: {
                            self.createN = true

                        }, label: {
                            Label("Note", systemImage: "note")
                        })

                    }
                    .sheet(isPresented: $showSheet, content: {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)

                    })
                    .font(.system(size: 170))
                    .foregroundColor(.white)
                    .padding(.bottom, 210)
                    .padding(.leading)
                    .padding(.trailing, 10)
                }

                Text("By tapping on the plus Symbol you will be able to add your records")
                    .font(.system(size: 20))
                    .padding([.trailing, .leading])
            }
        }

        if createN {
            createNote()
        }
    }
}

struct createNote: View {

    var body: some View{
        Text("ciao")
    }
}

struct DeriveView_Previews: PreviewProvider {
    static var previews: some View {
        DeriveView()
    }
}
