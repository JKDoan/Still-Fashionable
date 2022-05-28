//
//  ViewController.swift
//  Still Fashionable V2
//
//  Created by Jenny Kim Doan on 10/03/2022.
//
//  Resources used:
//  https://www.youtube.com/watch?v=ZyM6rlo4Des
//  https://www.youtube.com/watch?v=XhD_Y6kLJqk
//  https://www.youtube.com/watch?v=JV9Oqyle3iE
//  https://www.youtube.com/watch?v=OunS3tLLrPY
//  https://www.youtube.com/watch?v=XzyF36Wun3U
//  https://www.youtube.com/watch?v=qA9L3_cK9Z0

//  https://www.youtube.com/watch?v=ZyM6rlo4Des

import UIKit
import Firebase

class ViewController: UIViewController, UITextViewDelegate {
    
    //text placeholders
    let nameTitlePlaceholder = "e.g White dress"
    let descriptionPlaceholder = "e.g Still brand new/ only worn a few times"
    let categoryPlaceholder = "e.g Dress"
    let pricePlaceholder = "e.g 20,00"
    let conditionPlaceholder = "e.g Rarely worn"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        NameTitle.delegate = self
        Description.delegate = self
        Category.delegate = self
        Price.delegate = self
        Condition.delegate = self
        
        // assigns placeholder texts to the texrviews
        NameTitle.text = nameTitlePlaceholder
        Description.text = descriptionPlaceholder
        Category.text = categoryPlaceholder
        Price.text = pricePlaceholder
        Condition.text = conditionPlaceholder
        
        // placeholder text is of a lightgray color
        NameTitle.textColor = .lightGray
        Description.textColor = .lightGray
        Category.textColor = .lightGray
        Price.textColor = .lightGray
        Condition.textColor = .lightGray
    }
    
    // When button clicked, info from UITextview's get sent and printed
    @IBAction func UploadPhoto(_ sender: UIButton, forEvent event: UIEvent) {
    }
    
    // UItextviews
    @IBOutlet var NameTitle: UITextView!
    
    @IBOutlet var Description: UITextView!
    
    @IBOutlet var Category: UITextView!
    
    @IBOutlet var Price: UITextView!
    
    @IBOutlet var Condition: UITextView!
    
    // button for sending data to firebase database
    @IBAction func Upload(_ sender: UIButton, forEvent event: UIEvent) {

        
        // if one of the blanks is empty, an error message is displayed and data is not send to the database
        if (NameTitle.text == nameTitlePlaceholder || Category.text == categoryPlaceholder || Price.text == pricePlaceholder || Condition.text == conditionPlaceholder || Description.text == descriptionPlaceholder) {
        
            let alert = UIAlertController(title: "Error!", message: "Please fill in all the blanks first.", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            let db = Firestore.firestore()
            
            // stores text in let
            let nameTitle = NameTitle.text
            let description = Description.text
            let category = Category.text
            let price = Price.text
            let condition = Condition.text
            
            // for testing purposes
            print(nameTitle!)
            print(description!)
            print(category!)
            print(price!)
            print(condition!)
            
            //makes a new document for firebase consisting of filled in text
            let newDocument = db.collection("order").document()
            
            // send the data to the firebase
            newDocument.setData(["title":nameTitle!, "description":description!,
                                 "category": category!,
                                 "price": price!,
                                 "condition": condition!,
                                 "id":newDocument.documentID])
        }
}
    
    // when text view gets edited the textviews are emptied
    func textViewDidBeginEditing(_ textView: UITextView) {
        if NameTitle.textColor == .lightGray{
            NameTitle.text = ""
            NameTitle.textColor = .black
        }
        
        if Description.textColor == .lightGray{
            Description.text = ""
            Description.textColor = .black
        }
        
        if Category.textColor == .lightGray{
            Category.text = ""
            Category.textColor = .black
        }
        
        if Price.textColor == .lightGray{
            Price.text = ""
            Price.textColor = .black
        }
        
        if Condition.textColor == .lightGray{
            Condition.text = ""
            Condition.textColor = .black
        }
    }
    
    // if textview no longer is edited placeholder will appear again
    func textViewDidEndEditing(_ textView: UITextView) {
        if NameTitle.text == "" {
            NameTitle.text = nameTitlePlaceholder
            NameTitle.textColor = .lightGray
        }
        
        if Description.text == "" {
            Description.text = descriptionPlaceholder
            Description.textColor = .lightGray
        }
        
        if Category.text == "" {
            Category.text = categoryPlaceholder
            Category.textColor = .lightGray
        }
        
        if Price.text == "" {
            Price.text = pricePlaceholder
            Price.textColor = .lightGray
        }
        
        if Condition.text == "" {
            Condition.text = conditionPlaceholder
            Condition.textColor = .lightGray
        }
        
    }
    
    @IBAction func move_view(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "buy_VC") as! BuyViewController
        present(vc, animated: true)
    }
}

