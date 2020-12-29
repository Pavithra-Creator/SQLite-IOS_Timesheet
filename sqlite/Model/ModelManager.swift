//
//  ModelManager.swift
//  sqlite
//
//  Created by Azar on 12/26/20.
//  Copyright © 2020 Pavithra. All rights reserved.
//

import Foundation
import UIKit

var shareInstance = ModelManager()
class ModelManager{
    var database : FMDatabase? = nil
    static func getInstance() -> ModelManager{
        if shareInstance.database == nil{
            shareInstance.database = FMDatabase(path: Util.share.getPath(dbName: "SqliteDemo.db"))
        }
        return shareInstance
    }
    func SaveStudent(student : StudentModel) -> Bool{
        shareInstance.database?.open()
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO student (name, mark,name1,mark1,name2,mark2,name3,mark3,name4,mark4,date,total) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)", withArgumentsIn: [student.name,student.mark,student.name1, student.mark1, student.name2,student.mark2,student.name3,student.mark3,student.name4, student.mark4,student.date,student.total])
        shareInstance.database?.close()
        return isSave!
    }
    
    func getAllStudent() -> [StudentModel]{
        shareInstance.database?.open()
        var students = [StudentModel]()
        do{
            let resultset: FMResultSet? = try shareInstance.database?.executeQuery("SELECT * FROM student", values: nil)
            if resultset != nil{
                while resultset!.next() {
                    let student = StudentModel(id: (resultset!.string(forColumn: "id")!), name: (resultset!.string(forColumn: "name")!), mark: (resultset!.string(forColumn: "mark")!),name1: (resultset!.string(forColumn: "name1")!), mark1: (resultset!.string(forColumn: "mark1")!),name2: (resultset!.string(forColumn: "name2")!), mark2: (resultset!.string(forColumn: "mark2")!),name3: (resultset!.string(forColumn: "name3")!), mark3: (resultset!.string(forColumn: "mark3")!),name4: (resultset!.string(forColumn: "name4")!), mark4: (resultset!.string(forColumn: "mark4")!),date: (resultset!.string(forColumn: "date")!),total: resultset!.string(forColumn: "total")!)
                                    students.append(student)
                    students.append(student)
                }
            }
        }
        catch let err{
            print(err.localizedDescription)
        }
        shareInstance.database?.close()
        return students
    }
    
    
    func updateStudent(student: StudentModel)->Bool{
        shareInstance.database?.open()
        let isUpdate = shareInstance.database?.executeUpdate("UPDATE student SET name=?, mark=?,date1=?,name1=?, mark1=?,name2=?, mark2=?,name3=?, mark3=?,name4=?, mark4=?,total=?, WHERE id=?", withArgumentsIn: [student.name, student.mark,student.name1, student.mark1,student.name2, student.mark2,student.name3, student.mark3,student.name4, student.mark4,student.date,student.total,student.id])
        
        shareInstance.database?.close()
        return isUpdate!
    }
    
    
    func deleteStudent(student: StudentModel)->Bool{
        shareInstance.database?.open()
        let isDeleted = shareInstance.database?.executeUpdate("DELETE FROM student WHERE name=?", withArgumentsIn: [student.name])
        shareInstance.database?.close()
        return isDeleted!
    }
    
}
