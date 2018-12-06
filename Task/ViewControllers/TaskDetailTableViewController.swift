//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Steve Lederer on 12/4/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    var dueDateValue: Date?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var taskDueTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDueTextField.inputView = dueDatePicker
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userTappedView))
        view.addGestureRecognizer(tapGesture)
        updateViews()
    }
    
    func updateViews() {
        guard let task = task, isViewLoaded else { return }
        title = task.name
        nameTextField.text = task.name
        notesTextView.text = task.notes
        taskDueTextField.text = task.due?.stringValue()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text, let notes = notesTextView.text, let date = dueDateValue else { return }
        if task == nil {
            TaskController.shared.add(taskWithName: name, notes: notes, due: date)
        } else {
            guard let task = task else { return }
            TaskController.shared.update(task: task, name: name, notes: notes, due: date)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateValue = dueDatePicker.date
        taskDueTextField.text = dueDatePicker.date.stringValue()
    }
    
    @objc func userTappedView(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        taskDueTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }
    
    
    
}
