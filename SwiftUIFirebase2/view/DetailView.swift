//
//  DetailView.swift
//  SwiftUIFirebase2
//
//  Created by Jon Eikholm on 15/03/2023.
//


import SwiftUI
import PhotosUI // thank you Apple !

struct DetailView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var picture: UIImage? // main GUI thread, works fine
    @State var message:String = ""
    var note:Note  // new
    @Binding var selection:Int
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button("Home") {
                        print("going home")
                        fService.mapTappedNote = nil
                    }
                    Button("Save") {
                        print("saving")
                        note.text = message
                        fService.updateNote(note: note)
                    }
                    Button("Delete image") {
                        note.image = nil
                        note.hasImage = false
                        picture = nil
                    }
                    
                }
                TextField("", text: $message, axis: .vertical)
                
                    Image(uiImage: picture ?? UIImage(systemName: "photo.circle.fill")!)
                        .resizable()
                        .frame(width: 250, height: 250)
            }
        }.toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                    Text("Select a photo")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: MapWrap(selection: $selection)) {
                    Text("Set location")
                }
            }
        }
        .onChange(of: selectedItem) { item in
            Task(priority: .background) {  // why background: It takes time to load
                print("image ready")
                // data
                if let data = try? await item?.loadTransferable(type: Data.self){
                    note.image = UIImage(data: data)
                    picture = note.image
                    note.hasImage = true
                }
            }
        }.onAppear(){
            print("onAppear ")
            message = note.text
            fService.mapTappedNote = note
            if note.hasImage {
                fService.downloadImage(note: note){ imageFromFB in
                    picture = imageFromFB  // will be executed in FirebaseService class
                }
            }
            if fService.didSelectLocation { // we just returned from Map
                if let loc = fService.currentLocation{
                    print("DetailView, fService.currentLocation \(loc)")
                    note.location = loc
                }
            }
        }
    }
}
