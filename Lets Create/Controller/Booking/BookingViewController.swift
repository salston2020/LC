//
//  BookingViewController.swift
//  Lets Create
//
//  Created by Sheena Alston on 4/6/21.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import Firebase

class BookingViewController: UIViewController {

    
    var refBooking: DatabaseReference!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var EventType: UITextField!
    @IBOutlet weak var quoteText: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var eventhours: UITextField!
    @IBOutlet weak var additionalEvent: UITextView!
    
    @IBOutlet weak var postedBy: UILabel!
    
    @IBOutlet weak var actionLabel: UILabel!
    
    @IBAction func actionButtonPressed(_ sender: Any) {
        addBooking()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        refBooking = Database.database().reference().child("Booking");
        // Do any additional setup after loading the view.
    }
    
    func addBooking(){
        

        let key = refBooking.childByAutoId().key
        
        let booking = ["id": key,
                       "eventName": nameTextField.text! as String,
                       "eventType": EventType.text! as String,
                       "eventPrice": quoteText.text! as String,
                       "eventZip": zipCode.text! as String,
                       "eventHours": eventhours.text! as String,
                       "postedBy": postedBy.text! as String,
                       "additionalInformation": additionalEvent.text! as String,]
        
               
                     
                       
                       
        
        
        refBooking.child(key!).setValue(booking)
        actionLabel.text = "Event Added"
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
