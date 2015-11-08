//
//  BirthdayViewController.swift
//  Mi Media Naranja
//
//  Created by Carlos on 07/11/15.
//  Copyright © 2015 UPM. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController {
    
    var date: NSDate?
    
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(date != nil){
            birthdayPicker.date = date!
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier{
            if identifier == "Ok Birthday" {
                date = birthdayPicker.date
            }
        }
    }
}
