//
//  SecondView.swift
//  AppMap
//
//  Created by Antonio Amoroso on 20/05/22.
//



import SwiftUI

struct SecondView: View {
    
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State var image = UIImage()
    
    var body: some View {
        
        VStack {
            Menu("+") {
                Button(action: {
                    
                }, label: {
                    Label("Audio", systemImage: "mic")                })
                Button(action: {
                    self.showSheet = true
                }, label: {
                    Label("Photo", systemImage: "camera")
                })
                Button(action: {
                    
                }, label: {
                    Label("Note", systemImage: "note")
                })

            }.sheet(isPresented: $showSheet, content: {
                ImagePicker(sourceType: .camera, selectedImage: self.$image)
    
            })
            .font(.system(size: 200))
                .foregroundColor(.white)
                .padding(.bottom, 200)
            
            
           
    
        
           
            
            
            Text("During your experience you will be able to record your notes by tapping on the plus symbol")
                .font(.system(size: 30))
                .padding([.trailing, .leading])
         
            
            
            
            
            
           
            
        }
      
        

   
    }
   

}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

