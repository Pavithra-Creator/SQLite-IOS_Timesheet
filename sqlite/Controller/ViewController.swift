//
//  ViewController.swift
//  sqlite
//
//  Created by Azar on 12/26/20.
//  Copyright © 2020 Pavithra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   // @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tblView: UITableView!
    var students = [StudentModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        students = ModelManager.getInstance().getAllStudent()
       tblView.reloadData()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        return students.count
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        cell.lbl_Name.text = students[indexPath.row].total
        cell.lbl_Mark.text = students[indexPath.row].date
        cell.btnEdit.tag = indexPath.row
        cell.btnDelete.tag = indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(onClickEdit(_:)), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(onClickDelete(_:)), for: .touchUpInside)
        return cell
        
    }
    func tableView(_ tableView:UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return  120
    }
    @objc func onClickEdit(_ sender:UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "AddStudentViewController") as! AddStudentViewController
        vc.studentData = students[sender.tag]
        vc.headerTitle = "Update"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func onClickDelete(_ sender:UIButton){
        let isDeleted = ModelManager.getInstance().deleteStudent(student: students[sender.tag])
        students.remove(at: sender.tag)
        tblView.reloadData()
        print("isDeleted:-\(isDeleted)")
    }
  
}
