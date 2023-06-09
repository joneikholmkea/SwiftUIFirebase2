//
//  MapWrap.swift
//  SwiftUIFirebase
//
//  Created by Jon Eikholm on 03/03/2023.
//

import SwiftUI
import CoreLocation
import MapKit

struct MapWrap: View {
    var region = myRegion.region
    @State var longPressLocation = CGPoint.zero
    @ObservedObject private var _fService = fService
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var selection:Int
    var theMap = MyMap(region: myRegion.region)
    
    var body: some View {
        VStack{
            theMap
                .confirmationDialog("", isPresented: $_fService.isConfirmShowing) {
                    Button("Save location to note?", role: .destructive) {
                        print("saved loc to note")
                        _fService.didSelectLocation = true
                        self.mode.wrappedValue.dismiss()
                    }
                }
        }.onAppear(){
            fService.mapTappedNote = nil // reset last selection
        }
    }
}


