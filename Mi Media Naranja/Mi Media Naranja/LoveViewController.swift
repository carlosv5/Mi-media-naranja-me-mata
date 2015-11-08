//
//  LoveViewController.swift
//  Mi Media Naranja
//
//  Created by Carlos on 07/11/15.
//  Copyright © 2015 UPM. All rights reserved.
//

import UIKit

class LoveViewController: UIViewController {

    var date: NSDate?
    
    @IBOutlet weak var lovePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(date != nil){
            lovePicker.date = date!
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier{
            if identifier == "Ok Love" {
                date = lovePicker.date
            }
        }
    }
}
