//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Steve Lederer on 12/5/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    weak var delegate: ButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateButton(_ isComplete: Bool) {

        let completeImage = UIImage(named: "complete")?.withRenderingMode(.alwaysTemplate)
        let incompleteImage = UIImage(named: "incomplete")?.withRenderingMode(.alwaysTemplate)
        if isComplete == true {
            completeButton.setImage(completeImage, for: .normal)
            completeButton.tintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            completeButton.setImage(incompleteImage, for: .normal)
            completeButton.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if let delegate = delegate{
            delegate.buttonCellButtonTapped(self)
        }
    }
}

extension ButtonTableViewCell {
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}

protocol ButtonTableViewCellDelegate: class {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}
