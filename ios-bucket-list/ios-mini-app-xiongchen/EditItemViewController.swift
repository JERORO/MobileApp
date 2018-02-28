//
//  EditItemViewController.swift
//  ios-mini-app-xiongchen
//
//  Created by Jiahong Chen on 2/18/18.
//  Copyright © 2018 Jiahong Chen. All rights reserved.
//

import UIKit

class EditItemViewController: UIViewController {

    
    
    var BItem : BucketItem!
    var itemName : String!
    var itemDescription : String!
    var itemLatitude : String!
    var itemLongitude : String!
    var itemStringDate : String!
    
    var itemDate : Date!
    
    @IBOutlet weak var nameText:UITextField?
    @IBOutlet weak var desText:UITextField?
    @IBOutlet weak var latText:UITextField?
    @IBOutlet weak var longText:UITextField?
    @IBOutlet weak var dateText:UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText?.text = itemName
        longText?.text = itemLongitude
        latText?.text = itemLatitude
        desText?.text = itemDescription
        dateText?.date = itemDate
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender:Any){
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        itemName = nameText?.text
        itemDescription = desText?.text
        itemLatitude = latText?.text
        itemLongitude = longText?.text
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        itemStringDate = dateFormatter.string(from: (dateText?.date)!)
        BItem = BucketItem(name: itemName, date: itemStringDate, description: itemDescription, finished: false, latitude: itemLatitude, longitude: itemLongitude)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
