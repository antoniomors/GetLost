//
//  MapView.swift
//  AppMap
//
//  Created by Antonio Amoroso on 20/05/22.
//

//import SwiftUI
//import MapKit
//import CoreLocation
//import CoreLocationUI



//struct MyAnnotationItem: Identifiable {
//    var latitude: Double
//    var longitude: Double
//    let id = UUID()
//}
//
//struct MapView: View {
//    //var ex
//    var annotationItems: [MyAnnotationItem] = [
//        MyAnnotationItem(latitude: 440.847923, longitude: 14.258164),
//    ]
//
//    // Location manager vars
//    @StateObject private var locationManager = ObservableLocationManager()
//    @State var defaultCordinate = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.839893, longitude: 14.251971), span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
//
//    init() {
//        UITabBar.appearance().backgroundColor = UIColor.black
//    }
//
//    var body: some View {
//        TabView {
//            NavigationView {
//                ZStack {
//                    Map(coordinateRegion: $locationManager.region, showsUserLocation: true, annotationItems: annotationItems) { item in
//                        MapMarker(coordinate: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude))
//                    }
//                    .edgesIgnoringSafeArea(.all)
//
//                        Button(action: {
////                            mapFilter()
//                            print("Hello")
//                        }, label: {
//                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
//                                .font(.system(size: 25))
//                        }).foregroundColor(.white)
//                            .frame(width: 40, height: 40)
//                            .background(.gray)
//                            .cornerRadius(60)
//                            .offset(x: 160, y: 200)
//
//                        Button(action: {
//                            locationManager.updateLocation()
//                        }, label: {
//                            Image(systemName: "location.fill")
//                                .font(.system(size: 25))
//                        }).foregroundColor(.white)
//                            .frame(width: 40, height: 40)
//                            .background(.gray)
//                            .cornerRadius(60)
//                            .offset(x: 160, y: 250)
//                    }
//                }
//
//                .tabItem {
//                    Image(systemName: "map")
//                    Text("Map")
//                }
//                NavigationView{
//                    DeriveView()
//                        .navigationTitle("GetLost")
//                }
//                .tabItem {
//                    Image(systemName: "mappin")
//                    Text("Dérive")
//                }
//                NavigationView{
//                    CollectionView()
//                        .navigationTitle("Collection")
//                }
//                .tabItem{
//                    Image(systemName: "globe")
//                    Text("Collection")
//                }
//            }
//        .accentColor(.white)
//        }
//
//    }
//
//    struct MapViewApp_Previews: PreviewProvider {
//        static var previews: some View {
//            MapView()
//        }
//    }
//
//    // user location
//
//    //final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
//    //
//    //    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.839893, longitude: 14.251971), span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
//    //
//    //    var locationManager: CLLocationManager?
//    //
//    //    override init() {
//    //        super.init()
//    //        locationManager?.delegate = self
//    //    }
//    //
//    //
//    //    func checkIfLocationServicesIsEnabled(){
//    //        if CLLocationManager.locationServicesEnabled() {
//    //            locationManager = CLLocationManager()
//    //            locationManager!.delegate = self
//    //
//    //
//    //
//    //        } else {
//    //            print("Print an alert that says that location services aren't enabled")
//    //        }
//    //
//    //    }
//    //    func checkLocationAuthorization() {
//    //     guard let locationManager = locationManager else { return }
//    //        switch locationManager.authorizationStatus {
//    //
//    //        case .notDetermined:
//    //            locationManager.requestWhenInUseAuthorization()
//    //        case .restricted:
//    //            print("ristretto")
//    //        case .denied:
//    //            print("negato")
//    //        case .authorizedAlways, .authorizedWhenInUse:
//    //            break
//    //        @unknown default:
//    //            break
//    //        }
//    //    }
//    //
//    //    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//    //        checkLocationAuthorization()
//    //    }
//    //
//    //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//    //        guard let latestLocation = locations.first else {
//    ////            shor error
//    //            return
//    //        }
//    //        DispatchQueue.main.sync {
//    //            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
//    //
//    //        }
//    //    }
//    //    func requestAllowLocationPermission() {
//    //        locationManager?.requestLocation()
//    //
//    //    }
//    //    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//    //        print(error.localizedDescription)
//    //    }
//    //}
//
//
//
//    final class ObservableLocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//        let mapView = MKMapView()
//
//        private let locationManager = CLLocationManager()
//
//        static let defaultDistance: CLLocationDistance = 1000000
//
//        @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.839893, longitude: 14.251971), span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
//
//        override init() {
//            super.init()
//
//            locationManager.delegate = self
//        }
//
//        func updateLocation() {
//            locationManager.requestLocation()
//        }
//
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            guard let location = locations.first else { return }
//
//            //        DispatchQueue.main.async {
//            self.region = MKCoordinateRegion(
//                center: location.coordinate,
//                latitudinalMeters: 1000,
//                longitudinalMeters: 1000
//            )
//            //        }
//        }
//
//        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//            // Error handling
//        }
//    }
