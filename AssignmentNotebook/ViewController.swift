//
//  ViewController.swift
//  AssignmentNotebook
//
//  Created by  on 4/11/19.
//  Copyright © 2019 RobertPrandeskiIOS. All rights reserved.
//
import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    let imagePicker = UIImagePickerController()
    
    var assignments = [Assignment]()
    
    @IBOutlet weak var myTabelView: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        

       if let theData = UserDefaults.standard.object(forKey: "assignments") as? Data
        {
            if let theAssignments = try? JSONDecoder().decode([Assignment].self, from: theData)
            {
        self.assignments = theAssignments
        myTabelView.reloadData()
            }
        }
        
        imagePicker.delegate = self
    
    }
    @IBAction func addAssignment(_ sender: UIBarButtonItem)
    {
        let alert = UIAlertController(title: "Add Assignment", message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Add Assignment", style: .default, handler: {action in
            var assignmentName = alert.textFields?[0].text ?? "Error"
            assignmentName = assignmentName + Date().description
            let dueDate = alert.textFields?[1].text ?? "Error"
            let a = Assignment(n: assignmentName, d: dueDate)
            self.assignments.append(a)
            self.myTabelView.reloadData()
            self.saveToUserDefaults()
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive, handler: {action in
        })
        alert.addTextField(configurationHandler: {textfield in
            textfield.placeholder = "Add Assignment"
        })
        alert.addTextField(configurationHandler: {textfield in
            textfield.placeholder = "Due Date"
        })
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let current = assignments[indexPath.row]
        cell.textLabel?.text = current.assignmentName
        cell.detailTextLabel?.text = current.dueDate
        cell.imageView?.image = current.image
        return cell
    }
    func saveToUserDefaults()
    {
        if let encodedData = try? JSONEncoder().encode(self.assignments)
        {
            UserDefaults.standard.set(encodedData, forKey: "assignments")
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
                {
            assignments.remove(at: indexPath.row)
            myTabelView.reloadData()
            saveToUserDefaults()
                }
    }
    @IBAction func cameraButton(_ sender: UIBarButtonItem)
    {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            print("trying to use picture")
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
                print("using picture")
                // create a new assignment with picture
                let newAssignment = Assignment(theImage: pickedImage)
                // add assignment to list of assignments
                self.assignments.append(newAssignment)
                // reload the tableview
                self.myTabelView.reloadData()
//                self.assignmentPic.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            }
            

        }
    }
}
