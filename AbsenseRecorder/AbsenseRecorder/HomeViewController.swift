//
//  ViewController.swift
//  AbsenseRecorder
//
//  Created by Karlson, Richard (JMOB) on 06/02/2020.
//  Copyright © 2020 Karlson, Richard (JMOB). All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addDummyData()
        //print("Test")
        updateDateDisplay()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        cell.textLabel?.text = divisions[indexPath.row].code
        cell.accessoryType = .checkmark
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedDivision = divisions[indexPath.row]
        
        var absence = Absence(date: currentDate)
        
        if let existingAbsence = selectedDivision.getAbsence(for: currentDate){
            absence = existingAbsence
            } else {
            let newAbsence = Absence(date: currentDate)
            selectedDivision.absences.append(newAbsence)

        }
        
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenseViewController", creator: { coder in
            return DivisionAbsenseViewController(coder: coder, division: selectedDivision, absence: absence)
            
        }) else {
            fatalError("Failed to load Division Absence View Controller from Storyboard")
        }
       

        navigationController?.pushViewController(vc, animated: true)
    }
    
    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "CW-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "CZ-1", of: 11))
        divisions.append(DivisionFactory.createDivision(code: "BZ-1", of: 12))
    }
    
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: +1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    @IBAction func previousDay(_ sender: Any) {
        
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    
    func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        navigationItem.title = formatter.string(from: currentDate)
    }
}

