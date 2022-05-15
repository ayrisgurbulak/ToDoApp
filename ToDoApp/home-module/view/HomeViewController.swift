//
//  ViewController.swift
//  ToDoApp
//
//  Created by Ayris Gürbulak on 10.05.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    
    var noteList = [Notes]()
    var homePresenterObject: ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        self.toDoTableView.rowHeight = 50
        self.toDoTableView.separatorColor = .gray
        
        copyDatabase()
        
        HomeRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePresenterObject?.getAllNotes()
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "ToDo", ofType: ".db")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("ToDo.db")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: copyPath.path) {
            print("Database is already exist.")
        }
        else {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyPath.path)
            } catch  {
            }
        }
    }

}

extension HomeViewController: PresenterToViewHomeProtocol {
    func sendDataToView(noteList: Array<Notes>) {
        self.noteList = noteList
        toDoTableView.reloadData()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        
        cell.toDoButton.layer.cornerRadius = 10
        cell.toDoButton.layer.borderWidth = 2
        cell.toDoButton.layer.borderColor = UIColor(named: "buttonBackground")?.cgColor
        
        cell.toDoLabel.text = noteList[indexPath.row].note
        
        if noteList[indexPath.row].isDone == 1 {
            cell.toDoButton.backgroundColor = UIColor(named: "buttonBackground")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = noteList[indexPath.row]
        performSegue(withIdentifier: "homeToUpdate", sender: note)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

