//
//  SenseView.swift
//  GetLost
//
//  Created by Antonio Amoroso on 13/06/22.
//

import SwiftUI
import CoreLocation
import AsyncLocationKit

struct SenseView: View {
    
    @Binding var rootIsActive: Bool
    let image: UIImage?
    let location: CLLocationCoordinate2D?
    
    // 5 colors of senses
    let gradientWithFourColors = Gradient(colors: [
        Color("ColorButton1"),
        Color("ColorButton2"),
        Color("ColorButton3"),
        Color("ColorButton4"),
        Color("ColorButton5")
    ]
    )
    
    @ObservedObject private var settings = UserSettings()
    
    // angular gradient var
    let angularGradient = AngularGradient(gradient: Gradient(colors: [Color("ButtonColor1"), Color("ButtonColor2"), Color("ButtonColor3"), Color("ButtonColor4"), Color("ButtonColor5")] ), center: .center, startAngle: .degrees(0), endAngle: .degrees(360))
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("Which sense is mostly\n \ninvolved in this record?")
                    .padding(.bottom, 500)
                    .font(.system(size: 24))
            }
            ButtonMenu()
            VStack {
                Spacer()
                //                Text("Where do you want to store your note?")
                //                    .multilineTextAlignment(.center)
                //                    .font(.system(size: 24))
                //                    .padding()
                
                // TODO: (card list)
                Button(action: {
                    Task {
                        try await savePhoto()
                    }
                    rootIsActive = false
                }, label: {
                    Text("Done")
                        .font(.system(size: 23))
                        .frame(width: 170, height: 45)
                        .foregroundColor(.white)
                        .background(Color(red: 0.2784313725490196, green: 0.2784313725490196, blue: 0.2784313725490196))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(angularGradient, lineWidth: 8))
                        .cornerRadius(10)
                        .padding(100)
                })
            }
        }.background(.black)
            .navigationBarHidden(true)
            .navigationBarHidden(true)
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func requestLocation() async throws -> CLLocationCoordinate2D? {
        let locationManager = AsyncLocationManager()
        let coordinate = try await locationManager.requestLocation()
        guard case let .didUpdateLocations(locations: coordinates) = coordinate else { return nil }
        return coordinates.first?.coordinate
    }
    
    private func savePhoto() async throws {
        var allModels = settings.cardListSave
        
        let newLocation: CLLocationCoordinate2D?
        if let currentLocation = location {
            newLocation = currentLocation
        } else {
            newLocation = try await requestLocation()
        }
        
        if allModels.count >= 1,
           let image = image,
           let location = newLocation,
           let data = image.jpegData(compressionQuality: 0.8) {
            let modelIndex = allModels.count-1
            
            // TODO: save photo not to first but to selected card
            
            var selectedModel = allModels[modelIndex]
            
            let fileURL = getDocumentsDirectory().appendingPathComponent("\(selectedModel.id.uuidString).png")
            try? data.write(to: fileURL)
            
            selectedModel.photo = PhotoModel(imageURL: fileURL, location: location.coordinate)
            allModels[modelIndex] = selectedModel
            settings.cardListSave = allModels
        }
    }
}

extension Color {
    static let hearing = Color("ColorButton5")
    static let sight = Color("ColorButton1")
    static let taste = Color("ColorButto4")
    
}

struct ButtonMenu : View {
    
    //selected button
    @State private var isSelected1 = false
    @State private var isSelected2 = false
    @State private var isSelected3 = false
    @State private var isSelected4 = false
    @State private var isSelected5 = false
    
    var body: some View {
        
        VStack {
            
            // HEARING BUTTON
            Button(action: {
                self.isSelected1.toggle()
                if isSelected1 {
                    isSelected2 = false
                    isSelected3 = false
                    isSelected4 = false
                    isSelected5 = false
                }
                
            }, label: { HStack {
            icon: do {Image(systemName: "ear.fill")
                    .foregroundColor(isSelected1 ? .orange : .gray)
                    .font(.system(size: 24))
                .padding(.trailing, 20)}
            title: do {Text("Hearing")
                    .fontWeight(isSelected1 ? .heavy : .regular)
                    .padding(.trailing, 20)
                .foregroundColor(.white)}
            }
            })
            
            Divider().frame(width: 200).background(.black)
            
            // SIGHT BUTTON
            Button(action: {
                self.isSelected2.toggle()
                if isSelected2 {
                    isSelected1 = false
                    isSelected3 = false
                    isSelected4 = false
                    isSelected5 = false
                }
                
            }, label: { HStack {
                
            icon: do {Image(systemName: "eye.fill").padding(.trailing, 20).font(.system(size: 24)).foregroundColor(isSelected2 ? .purple : .gray)}
                
            title: do {Text("Sight")
                    .fontWeight(isSelected2 ? .heavy : .regular)
                    .padding(.trailing, 46)
                .foregroundColor(.white)}
            }
            })
            Divider().frame(width: 200).background(.black)
            
            // SMELL BUTTON
            Button(action: {
                self.isSelected3.toggle()
                if isSelected3 {
                    isSelected2 = false
                    isSelected1 = false
                    isSelected4 = false
                    isSelected5 = false
                }
                
            }, label: {
                HStack{
                icon: do {Image(systemName: "nose.fill")
                        .foregroundColor(isSelected3 ? .green : .gray)
                        .padding(.trailing, 20)
                    .font(.system(size: 24))}
                title: do {Text("Smell").fontWeight(isSelected3 ? .heavy : .regular)
                        .padding(.trailing, 40)
                    .foregroundColor(.white)}
                }
            })
            Divider().frame(width: 200).background(.black)
            
            // TASTE BUTTON
            Button(action: {
                self.isSelected4.toggle()
                if isSelected4 {
                    isSelected2 = false
                    isSelected3 = false
                    isSelected1 = false
                    isSelected5 = false
                }
            }, label: {
                HStack{
                icon: do {Image(systemName: "mouth.fill")
                        .foregroundColor(isSelected4 ? .pink : .gray)
                        .padding(.trailing, 20)
                        .font(.system(size: 24))
                }
                    
                title: do {Text("Taste")
                        .fontWeight(isSelected4 ? .heavy : .regular)
                        .padding(.trailing, 40)
                        .foregroundColor(.white)
                }
                }
            })
            Divider().frame(width: 200).background(.black)
            
            // TOUCH BUTTON
            Button(action: {
                self.isSelected5.toggle()
                if isSelected5 {
                    isSelected2 = false
                    isSelected3 = false
                    isSelected4 = false
                    isSelected1 = false
                }
                
            }, label: {
                HStack {
                icon: do {Image(systemName: "hand.wave.fill")
                        .foregroundColor(isSelected5 ? .yellow : .gray)
                        .padding(.trailing, 20)
                    .font(.system(size: 24))}
                title: do {Text("Touch")
                        .fontWeight(isSelected5 ? .heavy : .regular)
                        .padding(.trailing, 40)
                    .foregroundColor(.white)}
                }
            })
            
        }.frame(width: 180, height:240)
            .background(Color(hue: 0.0, saturation: 0.026, brightness: 0.277))
            .cornerRadius(12)
        
    }
}
