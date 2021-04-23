//
//  Booking.swift
//  Lets Create
//
//  Created by Sheena Alston on 4/6/21.
//

import UIKit
import Firebase

class Booking: UIViewController, UITableViewDelegate, UITableViewDataSource {
  

    @IBOutlet weak var bookingtb: UITableView!
    
    
    var profileViewModel = [ProfileViewModel]()
    var bookingList = [BookingModel]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookingList.count
    }
    
   
                
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! bookingCellTableViewCell
        
        let booking: BookingModel
        
        booking = bookingList[indexPath.row]
        
        cell.eventNameLabel.text = booking.eventName
        cell.eventType.text = booking.eventType
        cell.quoteTextLabel.text = booking.eventPrice
        
        return cell
    }
    
    var refBooking: DatabaseReference!
    
   
    
    
    @IBAction func addNewBooking(_ sender: Any) {
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            performSegue(withIdentifier: "addNewBooking", sender: indexPath.row)
        }    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        refBooking = Database.database().reference().child("Booking");
        refBooking.observeSingleEvent(of: DataEventType.value, with:{(snapshot) in
            if snapshot.childrenCount>0{
                self.bookingList.removeAll()
                
                for booking in snapshot.children.allObjects as! [DataSnapshot] {
                    let bookingObject = booking.value as? [String: AnyObject]
                    let eventName = bookingObject?["eventName"]
                    let eventType = bookingObject?["eventType"]
                    let eventPrice = bookingObject?["eventPrice"]
                    let eventZip = bookingObject?["eventZip"]
                    let eventHours = bookingObject?["eventHours"]
                    let additionalInformation = bookingObject?["additionalInformation"]
                    let postedBy = bookingObject?["postedBy"]
                    let eventID = bookingObject?["id"]
                
                    let booking = BookingModel(id: eventID as! String?, eventName: eventName as! String?, eventType: eventType as! String?, eventPrice: eventPrice as! String?, eventZip: eventZip as! String?, eventHours: eventHours as! String?, additionalInformation: additionalInformation as! String?, postedBy: postedBy as! String?)
                    
                    
                   
                    self.bookingList.append(booking)
            }
                DispatchQueue.main.async {
                    self.bookingtb.reloadData()
                            }
               
            }
        })
    
    }

    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EventDetails", sender: self)
    }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "EventDetails") {
            if let detailsVC = segue.destination as? MoreDetailedBookingViewController {
                if let indexPath = self.bookingtb.indexPathForSelectedRow {
                    let booking = bookingList[indexPath.row]
                    if let cell = self.bookingtb.cellForRow(at: indexPath) as? bookingCellTableViewCell {
                        detailsVC.eventName = cell.eventNameLabel.text!
                    }
                    detailsVC.eventName = booking.eventName!
                    detailsVC.eventType = booking.eventType!
                    detailsVC.eventPrice = "$ " + booking.eventPrice!
                    detailsVC.eventZip = booking.eventZip!
                    detailsVC.eventHours = booking.eventHours!
                    
                    detailsVC.additionalInformation = booking.additionalInformation!
        }
    

            }
        }
    }

}
