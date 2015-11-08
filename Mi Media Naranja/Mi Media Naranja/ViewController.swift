//
//  ViewController.swift
//  Mi Media Naranja
//
//  Created by Carlos on 07/11/15.
//  Copyright © 2015 UPM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var birthdayDate : NSDate?
    var loveDate: NSDate?

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var birthdayButton: UIButton!
    @IBOutlet weak var loveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "Go Birthday":
                if let vc = segue.destinationViewController as? BirthdayViewController {
                    if(birthdayDate != nil){
                        vc.date = birthdayDate!
                    }
                }
            case "Go Love":
                if let vc = segue.destinationViewController as? LoveViewController {
                    if(loveDate != nil){
                        vc.date = loveDate!
                    }
                }
            default:
                break
            }
        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func volver(segue: UIStoryboardSegue){
        if let vc = segue.sourceViewController as? BirthdayViewController {
            birthdayDate = vc.date
            if(birthdayDate != nil){
            setTitle(format(birthdayDate!), toButton: birthdayButton)
            }
        }
        
        if let vc = segue.sourceViewController as? LoveViewController {
            loveDate = vc.date!
            if(loveDate != nil){
            setTitle(format(loveDate!), toButton: loveButton)
            }
        }
        

    }
    @IBAction func calcular(sender: UIButton) {
        if((birthdayDate != nil) && (loveDate != nil)){
            if(loveDate!.compare(birthdayDate!) == NSComparisonResult.OrderedAscending ){
                result.text = "Has introducido mal los datos"
            }
            else{
                let time = loveDate!.timeIntervalSinceDate(birthdayDate!)
                let fecha: NSDate = NSDate(timeInterval: time*2, sinceDate:NSDate())
                result.text = format(fecha)
            }
        } else{
            result.text = "Te falta por introducir datos"
        }
    }
        
    
    private func format(formatDate:NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEEE dd MMMM YYYY"
        let formatedString = formatter.stringFromDate(formatDate)
        return formatedString
    }
    private func setTitle(title: String, toButton button: UIButton) {
        button.setTitle(title == "" ? "Elegir" : "\(title)", forState: .Normal)
    }
    
    
}



