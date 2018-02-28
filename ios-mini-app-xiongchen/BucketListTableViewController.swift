//
//  ViewController.swift
//  ios-mini-app-xiongchen
//
//  Created by Jiahong Chen on 2/10/18.
//  Copyright © 2018 Jiahong Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView:UITableView?
    
    var bucketList = [BucketItem]()
    var passItem : BucketItem!
    
    func loadBucketItems() {
        let item1 = BucketItem(name: "Register for Grad", date: "01/10/2018", description: "Submit application", finished: false, latitude: "8.0", longitude: "8.0")
        let item2 = BucketItem(name: "Sell Books", date: "08/28/2018", description: "Textbooks", finished: false, latitude: "8.0", longitude: "8.0")
        let item3 = BucketItem(name: "Say hi", date: "06/06/2018", description: "YAY", finished: true, latitude: "8.0", longitude: "8.0")
        bucketList += [item1, item2, item3]
        sortBucketItems()
    }
    
    func sortBucketItems() {
        bucketList.sort() { $0.name < $1.name }
        bucketList.sort() { $0.date < $1.date }
        bucketList.sort() { !$0.finished && $1.finished }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (bucketList.count)
    }
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = bucketList[indexPath.row].name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let convertedDate = dateFormatter.string(from: bucketList[indexPath.row].date)
        cell.detailTextLabel?.text=convertedDate
    
        if (bucketList[indexPath[1]].finished){
            cell.backgroundColor = .gray
        }else{
            cell.backgroundColor = .white
        }
        
        return (cell)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBucketItems()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindFromAddVC(_ sender: UIStoryboardSegue){
        if sender.source is AddItemViewController{
            if let senderVC = sender.source as? AddItemViewController{
                bucketList.append(senderVC.BItem)
            }
        }
        sortBucketItems()
        tableView?.reloadData()
    }
    
    @IBAction func unwindFromEditVC(_ sender: UIStoryboardSegue){
        if sender.source is EditItemViewController{
            if let senderVC = sender.source as? EditItemViewController{
                let isFinish = passItem.finished
                let index = bucketList.index{$0 === passItem}
                bucketList.remove(at: index!)
                senderVC.BItem.finished = isFinish
                bucketList.append(senderVC.BItem)
            }
        }
        sortBucketItems()
        tableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let current = self.bucketList[indexPath[1]]
        
        let delAction = UITableViewRowAction(style: .destructive, title: "Delete"){
            _,_ in
            self.bucketList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        delAction.backgroundColor = .red
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit"){
            (rowAction, indexPath) in
            self.passItem = current
            self.performSegue(withIdentifier: "EditItem", sender: self)
        }
        editAction.backgroundColor = .orange
        
        if (current.finished) {
            let doneAction = UITableViewRowAction(style: .normal, title: "Not Done") { (action, indexPath) in
                current.finished = false
                self.sortBucketItems()
                tableView.reloadData()
            }
            doneAction.backgroundColor = .blue
            return [doneAction, editAction, delAction]
        } else {
            let doneAction = UITableViewRowAction(style: .normal, title: "Done") { (action, indexPath) in
                current.finished = true
                self.sortBucketItems()
                tableView.reloadData()
            }
            doneAction.backgroundColor = .green
            return [doneAction, editAction, delAction]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditItem"{
            let nav = segue.destination as! UINavigationController
            let dest = nav.topViewController as! EditItemViewController
            dest.itemName = passItem.name
            dest.itemLongitude = passItem.longitude
            dest.itemLatitude = passItem.latitude
            dest.itemDescription = passItem.description
            dest.itemDate = passItem.date
        }
    }

}

