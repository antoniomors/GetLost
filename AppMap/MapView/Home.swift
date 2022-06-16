//
//  Home.swift
//  GetLost
//
//  Created by Muhamed Agakishiev on 09/06/22.
//

import SwiftUI
import MapKit

struct Home: View {
    
    @StateObject var mapData = MapViewModel()
    @ObservedObject private var settings = UserSettings()
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
    }
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 40.8518,
            longitude: 14.2681),
        latitudinalMeters: .init(10000),
        longitudinalMeters: .init(10000))
    
    var body: some View {
        TabView {
            ZStack{
                
                MapView(annotationItems: settings.$cardListSave)
                    .environmentObject(mapData)
                    .ignoresSafeArea(.all, edges: .all)
                
                VStack {
                    VStack(spacing: 0){
                        HStack{
                            
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                            
                            TextField("Search", text: $mapData.searchTxt)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical,8)
                        .padding(.horizontal)
                        .background(.gray.opacity(0.7))
                        .cornerRadius(10)
                        
                        // Displaying Results...
                        
                        if !mapData.places.isEmpty && mapData.searchTxt != ""{
                            
                            ScrollView{
                                
                                VStack(spacing: 15){
                                    
                                    ForEach(mapData.places){place in
                                        
                                        Text(place.placemark.name ?? "")
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                            .padding(.leading)
                                            .onTapGesture{
                                                
                                                mapData.selectPlace(place: place)
                                            }
                                        
                                        Divider()
                                    }
                                }
                                .padding(.top)
                            }
                            .background(.gray)
                        }
                        
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack{
                        
                        Button(action: mapData.updateMapType, label: {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                .font(.title2)
                                .padding(10)
                                .background(.gray)
                                .cornerRadius(60)
                                .foregroundColor(.white)
                        })
                        
                        Button(action: mapData.focusLocation, label: {
                            
                            Image(systemName: "location.fill")
                                .font(.title2)
                                .padding(10)
                                .background(.gray)
                                .cornerRadius(60)
                                .foregroundColor(.white)
                        })
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(5)
                    Spacer()
                        .frame(height: 30)
                }
            }
            // Permission Denied Alert...
            .alert(isPresented: $mapData.permissionDenied, content: {
                
                Alert(title: Text("Permission Denied"), message: Text("Please Enable Permission In App Settings"), dismissButton: .default(Text("Goto Settings"), action: {
                    
                    // Redireting User To Settings...
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }))
            })
            .onChange(of: mapData.searchTxt, perform: { value in
                
                // Searching Places...
                
                // You can use your own delay time to avoid Continous Search Request...
                let delay = 0.3
                
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    
                    if value == mapData.searchTxt{
                        
                        // Search...
                        self.mapData.searchQuery()
                    }
                }
            })
            
            .tabItem {
                Image(systemName: "map")
                Text("Map")
            }
            NavigationView {
                if settings.cardListSave.isEmpty {
                    emptyDerive()
                } else {
                    DeriveView()
                        .navigationTitle("Dérive")
                }
            }
            .tabItem {
                Image(systemName: "mappin")
                Text("Dérive")
            }
            NavigationView{
                CollectionView()
                    .navigationTitle("Collection")
            }
            .tabItem{
                Image(systemName: "globe")
                Text("Collection")
            }
            
        }.accentColor(.white)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
