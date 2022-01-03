//
//  MemoDataViewController.swift
//  MyColorMemoApp
//
//  Created by fyky on 2022/01/03.
//

import UIKit

class MemoDetailViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var text: String = ""
    var recordDate: Date = Date()
    
    // データの表示形式を変える
    var dateFormat: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        return dateFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    }
    
    func configure(memo: MemoDataModel){
        text = memo.text
        recordDate = memo.recordDate
        print("データは\(text)と\(recordDate)です")
    }
    
    func displayData() {
        textView.text = text
        navigationItem.title = dateFormat.string(from: recordDate)
    }
}
