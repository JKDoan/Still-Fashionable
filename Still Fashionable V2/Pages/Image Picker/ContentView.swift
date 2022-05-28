//
//  ContentView.swift
//  Image selector
//
//  Created by Ange Mutesi
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        
        VStack{
            if selectedImage != nil{
                Image(uiImage: selectedImage!)
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            Button{
                
                // Show image picker
                isPickerShowing = true
                
            } label: {
                Text("Upload a photo")
            }
            
        }
        .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
            //Image picker
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
        }
    }
}

class ChildHostingController: UIHostingController<ContentView> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: ContentView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
