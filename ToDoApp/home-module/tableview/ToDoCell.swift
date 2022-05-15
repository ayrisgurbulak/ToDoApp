//
//  NoteCell.swift
//  ToDoApp
//
//  Created by Ayris Gürbulak on 10.05.2022.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var toDoView: UIView!
    @IBOutlet weak var toDoButton: UIButton!
    @IBOutlet weak var toDoLabel: UILabel!
    
    var buttonSelected = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func toDoButtonPressed(_ sender: UIButton) {
        
        if buttonSelected == false {
            toDoButton.backgroundColor = UIColor(named: "buttonBackground")
            buttonSelected = true
        }
        else if buttonSelected == true {
            toDoButton.backgroundColor = .clear
            buttonSelected = false
        }
        
        
    }
}
