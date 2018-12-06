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
        if isComplete == true {
            completeButton.setImage(#imageLiteral(resourceName: "complete"), for: .normal)
        } else {
            completeButton.setImage(#imageLiteral(resourceName: "incomplete"), for: .normal)
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
