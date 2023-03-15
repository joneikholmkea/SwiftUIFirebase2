//
//  MyRegion.swift
//  SwiftUIFirebase2
//
//  Created by Jon Eikholm on 15/03/2023.
//
import MapKit

var myRegion = MyRegion()
struct MyRegion {
    
 let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.5, longitude: 5.75), span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15))
    
}
