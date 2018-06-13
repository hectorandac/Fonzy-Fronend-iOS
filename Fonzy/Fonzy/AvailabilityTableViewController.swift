//
//  AvailabilityTableViewController.swift
//  Fonzy
//
//  Created by fitmap on 2/2/18.
//  Copyright © 2018 Biocore. All rights reserved.
//

import UIKit

//create delegate in controller that contains picker
protocol pickerChangedDelegate{
    func onPickerChanged(val date: Date)
}


struct Availability {

    var checkBox: UIImage?
    var dayLabel: String
    var startTime: String
    var endTime: String

}

class AvailabilityTableViewController: UITableViewController {

    let cellIdentifier = "availabilityCell"
    var days = [Availability]()
    var delegate: pickerChangedDelegate? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        loadDummyAvailability()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return days.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AvailabilityTableViewCell else {
            fatalError("The dequeued cell is not an instance of shoptableViewCell")
        }
        
        let day = days[indexPath.row]
        
        cell.dayLabel.text = day.dayLabel
        cell.checkboxImage.image = day.checkBox
        cell.startTimeTextField.text = day.startTime
        cell.endTimeTextField.text = day.endTime
        
        cell.dayLabel.layer.borderColor = #colorLiteral(red: 0.3294814825, green: 0.006894377992, blue: 0.1478647888, alpha: 1)
        cell.dayLabel.layer.borderWidth = 2
        // Configuring "button" = TextField
        let datePickerView: UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = .time
        
        cell.startTimeTextField.inputView = datePickerView
        cell.endTimeTextField.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(AvailabilityTableViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
        return cell
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        
        //        birthdayTextField.text = dateFormatter.string(from: sender.date)
        delegate?.onPickerChanged(val: sender.date)

    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadDummyAvailability(){
        let monday = Availability(checkBox: UIImage(named: "boxUnchecked"), dayLabel: "      MONDAY", startTime: "09:00 AM", endTime: "08:00 PM")
        let tuesday = Availability(checkBox: UIImage(named: "boxUnchecked"), dayLabel: "      TUESDAY", startTime: "09:00 AM", endTime: "08:00 PM")
        let wednesday = Availability(checkBox: UIImage(named: "boxUnchecked"), dayLabel: "      WEDNESDAY", startTime: "09:00 AM", endTime: "08:00 PM")
        let thursday = Availability(checkBox: UIImage(named: "boxUnchecked"), dayLabel: "      THURSDAY", startTime: "09:00 AM", endTime: "08:00 PM")
        let friday = Availability(checkBox: UIImage(named: "boxUnchecked"), dayLabel: "      FRIDAY", startTime: "09:00 AM", endTime: "08:00 PM")
        
        days.append(monday)
        days.append(tuesday)
        days.append(wednesday)
        days.append(thursday)
        days.append(friday)
        
        
    }

}