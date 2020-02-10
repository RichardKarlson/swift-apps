//
//  DivisionAbsenseViewController.swift
//  AbsenseRecorder
//
//  Created by Karlson, Richard (JMOB) on 08/02/2020.
//  Copyright © 2020 Karlson, Richard (JMOB). All rights reserved.
//

import UIKit

class DivisionAbsenseViewController: UITableViewController {
    
    var division: Division
    var absence: Absence
    
    init?(coder: NSCoder, division: Division, absence: Absence){
        self.division = division
        self.absence = absence
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder){
        fatalError("You must create this Controller with a Division and Absence")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = division.code
        
        if let selectedRows = absence.selectedRows{
            for selectedRow in selectedRows{
                tableView.selectRow(at: selectedRow, animated: false, scrollPosition: .none)
            }
            
        }

      
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return division.students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        cell.textLabel?.text = division.students[indexPath.row].surname
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStudent = division.students[indexPath.row]
        absence.present.append(selectedStudent)

    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let selectedStudent = division.students[indexPath.row]
        absence.present.removeAll {
            $0.forename == selectedStudent.forename && $0.surname == selectedStudent.surname
        }
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        absence.selectedRows = tableView.indexPathsForSelectedRows
    }

}
