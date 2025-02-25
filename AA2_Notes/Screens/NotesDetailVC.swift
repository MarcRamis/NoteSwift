//
//  NotesDetailVC.swift
//  AA2_Notes
//
//  Created by Marc Ramis on 1/6/23.
//

import Foundation
import UIKit


class NotesDetailVC : VC {
    
    public var NotesList: NotesListVC?
    public var CurrentNote: Note?
    public var CurrentNoteIdx: Int?
    
    weak var modifierDelegate: ModifierDelegate?
    
    var titlePageLabel = TextField()
    var descriptionText = TextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InitializeView()
        
        modifierDelegate = NotesList
    }

}

extension NotesDetailVC{
    
    func InitializeView()
    {
        // Note title
        if let note = CurrentNote{
            
            // Title view
            let titleView = View()
            titleView.backgroundColor = .Background
            self.view.addSubview(titleView)
            titleView
                .AlignLeftTo(self.view)
                .AlignRightTo(self.view)
                .AlignTopTo(self.view)
            
            // Description view
            let descriptionView = View()
            descriptionView.backgroundColor = .white
            self.view.addSubview(descriptionView)
            descriptionView
                .AlignLeftTo(self.view)
                .AlignRightTo(self.view)
                .RelativeTopTo(titleView)
                .AlignBotTo(self.view)
        
        
            // Label
            titlePageLabel.text = note.title
            titleView.addSubview(titlePageLabel)
            titlePageLabel
                .AlignCenterHorizontallyTo(titleView)
                .AlignBotTo(titleView, padding: 5)
                .AlignTopTo(titleView, padding: 5)
            
            titlePageLabel.textAlignment = NSTextAlignment.center
            titlePageLabel.isUserInteractionEnabled = true
            
            // Description
            descriptionText.text = note.description
            descriptionView.addSubview(descriptionText)
            descriptionText
                .PinTo(other: descriptionView)
            
            descriptionText.isUserInteractionEnabled = true
            descriptionText.isEditable = true
            
            // Save button
            let saveBtn = Button(Label("Save")) {btn in
                self.SaveNote()
            }
            saveBtn.backgroundColor = .Button_Save
            titleView.addSubview(saveBtn)
            saveBtn
                .AlignLeftTo(titleView, padding: 5)
                .AlignBotTo(titleView, padding: 5)
                .AlignTopTo(titleView, padding: 5)

            // Delete button
            let deleteBtn = Button(Label("Delete")) {btn in
                self.DeleteNote()
            }
            deleteBtn.backgroundColor = .Button_Remove
            titleView.addSubview(deleteBtn)
            deleteBtn
                .AlignRightTo(titleView, padding: 5)
                .AlignBotTo(titleView, padding: 5)
                .AlignTopTo(titleView,padding: 5)
        }
    }
    
    func SaveNote() {
        if let currentIdx = CurrentNoteIdx{
            modifierDelegate?.OnChange(title: titlePageLabel.text ?? "Title", description: descriptionText.text, index: currentIdx)
        }
        
        self.dismiss(animated: true)
    }
    
    func DeleteNote() {
        
        if let currentIdx = CurrentNoteIdx{
            modifierDelegate?.OnDelete(index: currentIdx)
        }
        
        self.dismiss(animated: true)
    }
}
    
protocol ModifierDelegate : class {
    func OnChange(title: String, description: String, index: Int)
    func OnDelete(index: Int)
}
