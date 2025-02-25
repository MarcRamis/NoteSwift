//
//  ViewController.swift
//  AA2_Notes
//
//  Created by Marc Ramis on 19/5/23.
//

import UIKit

class NotesListVC: VC {

    public enum NoteState{
        case View
        case Edit
    }
    var notesState: NoteState = .View
    var notes: [Note] = []
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InitializeView()
        LoadNotes()
        
        table.delegate = self
        table.dataSource = self
        
        table.register(MyCell.self, forCellReuseIdentifier: MyCell.Id)
        
        table.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nav = segue.destination as? UINavigationController, let notesDetailVC = nav.topViewController as? NotesDetailVC {
            notesDetailVC.modifierDelegate = self
        }
    }
}

extension NotesListVC{
    
    func InitializeView()
    {
        let titleView = View()
        self.view.addSubview(titleView)
        titleView
            .AlignLeftTo(self.view)
            .AlignRightTo(self.view)
            .AlignTopTo(self.view)
        titleView.backgroundColor = .Background
        
        let tableView = View()
        self.view.addSubview(tableView)
        tableView
            .AlignLeftTo(self.view)
            .AlignRightTo(self.view)
            .RelativeTopTo(titleView)
            .AlignBotTo(self.view)
        tableView.backgroundColor = .white
        
        self.view.addSubview(table)
        table.PinTo(other: tableView)
        
        let titlePageLabel = Label("Notes".Translated)
        titleView.addSubview(titlePageLabel)
        titlePageLabel
            .PinTo(other: titleView)
        
        // View/Edit Button
        let viewTextTranslated = "View".Translated
        let editTextTranslated = "Edit".Translated
        
        let notesTitleBtn = Button(Label(viewTextTranslated)) {btn in
            self.SwapState()
            if (self.notesState == .View)
            {
                btn.label?.text = viewTextTranslated
            }
            else
            {
                btn.label?.text = editTextTranslated
            }
            self.table.reloadData()
        }
        notesTitleBtn.backgroundColor = .Button_ViewEdit
        titleView.addSubview(notesTitleBtn)
        notesTitleBtn
            .AlignRightTo(titleView, padding: 5)
            .AlignBotTo(titleView, padding: 5)
            .AlignTopTo(titleView, padding: 5)
    
        let addNoteBtn = Button(Label("+")) {_ in
            self.AddNote()
        }
        
        self.view.addSubview(addNoteBtn)
        addNoteBtn.backgroundColor = .Button_AddNote
        addNoteBtn
            .AlignRightTo(self.view, padding: .space2)
            .AlignBotTo(self.view, padding: .space2)
            .SetHeight(size: .ButtonType1).SetWidth(size: .ButtonType1)
    }
            
    func SwapState()
    {
        if (self.notesState == .View)
        {
            self.notesState = .Edit
        }
        else
        {
            self.notesState = .View
        }
            
    }
    
    func LoadNotes()
    {
        if let savedNotes: [Note] = UserDefaults.standard.get(key: "Notes") {
            notes = savedNotes
        }
    }
    
    func AddNote()
    {
        let tmpNote = Note(title: "Type a title...", description: "Type a description...", color: NamedUIColor(name: "PrimaryColor"))
        
        self.notes.append(tmpNote)
        SaveUserDefaults()
    }
    
    func SaveUserDefaults()
    {
        UserDefaults.standard.Save(data: self.notes, key: "Notes")
        UserDefaults.standard.synchronize()
        self.table.reloadData()
    }
    
    func ChangeNote(title: String, description: String, index: Int)
    {
        notes[index].title = title
        notes[index].description = description

        SaveUserDefaults()
    }
    
    func RemoveNote(index: Int)
    {
        self.notes.remove(at: index)
        self.SaveUserDefaults()
    }
}

extension NotesListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyCell.Id) as? MyCell else {
            return UITableViewCell()
        }
        
        var note = notes[indexPath.row]
        cell.Title.text = note.title
        cell.Description.text = note.description
        cell.RemoveButton.onClick = { button in
            self.notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.SaveUserDefaults()
        }
        
        // Change cell contraints
        if (self.notesState == .View)
        {
            cell.EnableViewMode()
        }
        else
        {
            cell.EnableEditMode()
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let newVC = NotesDetailVC()
        newVC.CurrentNote = notes[indexPath.row]
        newVC.NotesList = self
        newVC.CurrentNoteIdx = indexPath.row
        newVC.modalPresentationStyle = .fullScreen
        self.present(newVC, animated: true)
    }
}

extension NotesListVC: ModifierDelegate {
    func OnDelete(index: Int) {
        self.RemoveNote(index: index)
    }
    
    func OnChange(title: String, description: String, index: Int) {
        self.ChangeNote(title: title, description: description, index: index)
    }
}
