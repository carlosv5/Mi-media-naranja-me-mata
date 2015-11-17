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
            loveDate = vc.date
            if(loveDate != nil){
            setTitle(format(loveDate!), toButton: loveButton)
            }
        }
        

    }
    @IBAction func calcular(sender: UIButton) {
        if((birthdayDate != nil) && (loveDate != nil)){
            if(loveDate!.compare(birthdayDate!) == NSComparisonResult.OrderedAscending ){
                result.text = ""
                showAlert("Datos mal introducidos",mensaje : "Por favor, introduce datos coherentes")
            }
            else{
                let time = loveDate!.timeIntervalSinceDate(birthdayDate!)
                let fecha: NSDate = NSDate(timeInterval: time*2, sinceDate:birthdayDate!)
                result.text = format(fecha)
            }
        } else{
            result.text = ""
            showAlert("Datos no introducidos", mensaje: "Por favor, introduce los datos que faltan")
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
    
    func showAlert(titulo:String , mensaje:String) {
        let alert = UIAlertController(title: titulo, message: mensaje,
        preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction( UIAlertAction(title: "Ok",
        style: UIAlertActionStyle.Default, handler: {(alert :UIAlertAction!) in
        print("Se pulsó OK")
        }))
        // Presentar el Alert Controller:
        presentViewController(alert, animated: true, completion: nil)
    }
    
}




