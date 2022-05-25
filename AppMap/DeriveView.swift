//
//  DeriveView.swift
//  AppMap
//
//  Created by Antonio Amoroso on 20/05/22.
//



import SwiftUI


struct DeriveView: View {
    // animation
    @State private var isRotated = false
    var animation: Animation {
        Animation.easeOut
            .repeatForever(autoreverses: true)
    }
    
//   @State var audio = AudioRecorder()
//    @ObservedObject var audioRecorder : AudioRecorder

//    sheetty
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
            
            Image("pag2")
                    .offset(x: 0, y: -100)
//                    .rotationEffect(.degrees(isRotated ? 360 : 0), anchor: .center)
//                           .animation(animation)
//
//                           .onAppear(perform: {
//                               isRotated = true
//                           })
    
                
            Menu("+") {
                Button(action: {
                    self.showRecord = true
                

            
                    print("pressed")
                    
                }, label: {
                    Label("Audio", systemImage: "mic")                })
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
           
    
          
           
            
            
            Text("During your experience you will be able to record your notes by tapping on the plus symbol")
                .font(.system(size: 30))
                .padding([.trailing, .leading])
         
            
            
            
            
            
           
            
        }
    }
    
        
      
        

        if createN {
            createNote()
        }
    }

}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        DeriveView()
    }
}


struct createNote: View {

    var body: some View{
        Text("ciao")
    }
}
