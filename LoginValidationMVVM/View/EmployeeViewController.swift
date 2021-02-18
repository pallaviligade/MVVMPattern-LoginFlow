//
//  EmployeeViewController.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 14/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableViewData: UITableView!
    
    var employeeResponseData :EmployeeResponse? = nil
    let employeeViewModel:EmployeeViewModel = EmployeeViewModel ()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableViewData.register(EmployeeTableViewCell.self, forCellReuseIdentifier: "EmployeeTableViewCell")
        
    
        // Do any additional setup after loading the view.
        getEmployeeByDepartment(segmentedControlIndex: 0)
       
    }
    private func getEmployeeByDepartment(segmentedControlIndex:Int)
    {
        employeeViewModel.getEmpolyeeByDepartement(DepartmentIndex: segmentedControlIndex) { (employeeResponse) in
            print("Under getEmployeeByDepartment ##########")

            if( employeeResponse != nil){
                
               print("Under getEmployeeByDepartment")
                DispatchQueue.main.async {
                     self.employeeResponseData = employeeResponse
                    self.tableViewData.reloadData()
                }
                
            }
        }
            
               
    }

    @IBAction func segmentControlerValueChange(_ sender: Any)
    {
        let segmentIndex = sender as! UISegmentedControl
        getEmployeeByDepartment(segmentedControlIndex: segmentIndex.selectedSegmentIndex)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
