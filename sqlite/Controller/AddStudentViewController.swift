//
//  AddStudentViewController.swift
//  sqlite
//
//  Created by Azar on 12/26/20.
//  Copyright © 2020 Pavithra. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {
   // @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtName: UITextField!
   
    @IBOutlet weak var txtName1: UITextField!
    
    @IBOutlet weak var txtName2: UITextField!
  
    @IBOutlet weak var txtName3: UITextField!
   
 
    @IBOutlet weak var txtName4: UITextField!
    
    @IBOutlet weak var txtDate: UITextField! //datefiled
    // @IBOutlet weak var sumtext: UILabel!
    //   @IBOutlet weak var txtMarks: UITextField!
    @IBOutlet weak var txtMarks: UITextField!
    
    @IBOutlet weak var txtMarks1: UITextField!
    @IBOutlet weak var txtMarks2: UITextField!
    @IBOutlet weak var txtMarks3: UITextField!
    @IBOutlet weak var hourlabel: UILabel!
    @IBOutlet weak var txtMarks4: UITextField!
    

    
    @IBOutlet weak var btnAdd: UIButton!
    var studentData : StudentModel?
    var headerTitle = ""
  
   
    @IBAction func getHour(_ sender: UIButton) {
        
        let first = Double(txtMarks.text!)
             let second = Double(txtMarks1.text!)
        let first1 = Double(txtMarks2.text!)
        let second1 = Double(txtMarks3.text!)
        let first2 = Double(txtMarks4.text!)
        
              let output = Double(first!+second!+first1!+second1!+first2!)
             hourlabel.text = "\(output)"
             

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        //datePicker
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        txtDate.inputView = picker
        picker.addTarget(self, action: #selector(pickerSelected(sender:)), for: .valueChanged)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
        view.addGestureRecognizer(gesture)
        
        
        
        
        
        
        
        
        //
        if headerTitle != "" {
            self.title = headerTitle
            txtName.text = studentData?.name
            txtMarks.text = studentData?.mark
          
            txtName1.text = studentData?.name1
                      txtMarks1.text = studentData?.mark1
            txtName2.text = studentData?.name2
                      txtMarks2.text = studentData?.mark2
            txtName3.text = studentData?.name3
                      txtMarks3.text = studentData?.mark3
            txtName4.text = studentData?.name4
                      txtMarks4.text = studentData?.mark4
            txtDate.text = studentData?.date
            hourlabel.text = studentData?.total
           // dateText.text = studentData?.date
          //  sumtext.text = txtMarks.text! + txtMarks1.text!
          
            
        }
      
    }
    

    @IBAction func onClickAdd(_ sender: UIButton) {
        
       
        
        
        if headerTitle != ""{
            let student = StudentModel(id: studentData!.id,name:txtName.text!,mark:txtMarks.text!,name1:txtName1.text!,mark1:txtMarks1.text!,name2:txtName2.text!,mark2:txtMarks2.text!,name3:txtName3.text!,mark3:txtMarks3.text!,name4:txtName4.text!,mark4:txtMarks4.text!,date:txtDate.text!,total: hourlabel.text!)
            let isUpdated = ModelManager.getInstance().updateStudent(student: student)
            print("isUpadted :=\(isUpdated)")
        }
        else{
            let student = StudentModel(id: "",name: txtName.text!, mark: txtMarks.text!,name1:txtName1.text!,mark1:txtMarks1.text!,name2:txtName2.text!,mark2:txtMarks2.text!,name3:txtName3.text!,mark3:txtMarks3.text!,name4:txtName4.text!,mark4:txtMarks4.text!,date: txtDate.text!,total: hourlabel.text!)
                        let isSave = ModelManager.getInstance().SaveStudent(student: student)
                        
                        print("isSave :- \(isSave)")
        }
        
     
    }
   
  @objc func pickerSelected(sender: UIDatePicker){
       let formatter = DateFormatter()
       formatter.dateFormat = "dd/MM/yyyy"
       txtDate.text = formatter.string(from: sender.date)
   }
   @objc func viewTapped(sender:UITapGestureRecognizer){
       
       view.endEditing(true)
   }
}
