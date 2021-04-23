//
//  MoreDetailedBookingViewController.swift
//  Lets Create
//
//  Created by Sheena Alston on 4/19/21.
//

import UIKit
import FirebaseAuth
import Firebase

class MoreDetailedBookingViewController: UIViewController {

    var bookingList = [BookingModel]()
    var data = [ProfileViewModel]()
    var refBooking: DatabaseReference!
    
  
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventTypeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var eventZiplb: UILabel!
    @IBOutlet weak var eventHourLb: UILabel!
    @IBOutlet weak var postedByLB: UILabel!
    
    @IBOutlet weak var additionalInformationlb: UILabel!
    
    var eventName: String = ""
    var eventType: String = ""
    var eventPrice: String = ""
    var eventZip: String = ""
    var additionalInformation: String = ""
    var eventHours: String = ""
    
            
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventNameLabel.text = eventName
        eventTypeLabel.text = eventType
        priceLabel.text = eventPrice
        eventZiplb.text = eventZip
        eventHourLb.text = eventHours
        additionalInformationlb.text = additionalInformation
       
        
        data.append(ProfileViewModel(viewModelType: .info,
                                     title: "\(UserDefaults.standard.value(forKey:"name") as? String ?? "No Name")",
                                     handler: nil))
                    
    }
    
    
 
        

        
}
