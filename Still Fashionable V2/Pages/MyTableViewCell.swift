//
//  MyTableViewCell.swift
//  Still Fashionable V2
//
//  Created by Jenny Kim Doan on 15/03/2022.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    @IBOutlet var button: UIButton!
    
    @IBAction func didTapButton() {
        
    }
    
    func configure(with title: String) {
        button.setTitle(title, for: .normal)
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button.setTitleColor(.label, for: .normal)
    }
    
}
