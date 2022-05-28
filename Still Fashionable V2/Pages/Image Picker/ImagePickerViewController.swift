//
//  ImagePickerViewController.swift
//  Still Fashionable V2
//
//  Created by Jenny Kim Doan on 15/03/2022.
//

import UIKit
import SwiftUI



class ImagePickerViewController: UIViewController {

    @State var isPickerShowing = false
    
    @IBAction func picker(_ sender: UIButton, forEvent event: UIEvent) {
        isPickerShowing = true
    }
    
    let contentView = UIHostingController(rootView: ContentView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView.view)
        addChild(contentView)
        view.addSubview(contentView.view)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
}
