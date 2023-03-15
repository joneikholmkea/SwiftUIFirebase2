//
//  Note.swift
//  SwiftUIFirebase2
//
//  Created by Jon Eikholm on 15/03/2023.
//
import Foundation
import UIKit
import MapKit

class Note:Identifiable {
    var id:String
    var text:String
    var image:UIImage? = nil
    var hasImage = false
    var location:Location? = nil
    var annotation:MKPointAnnotation? = nil
    
    init(id: String, text: String, hasImage:Bool) {
        self.id = id
        self.text = text
        self.hasImage = hasImage
    }
    
}
