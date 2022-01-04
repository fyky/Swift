//
//  HomeViewController.swift
//  MyColorMemoApp
//
//  Created by fyky on 2022/01/01.
//

import Foundation
import UIKit // UIに関するクラスが格納されたモジュール

// HomeViewControllerにUIViewControllerを”クラス継承”する
class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var memoDataList: [MemoDataModel] = []
    
    // データの表示形式を変える
    var dateFormat: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        return dateFormatter
    }
    
    override func viewDidLoad() {
        // このクラスの画面が表示される際に呼び出されるメソッド
        // 画面の表示・非表示に応じて実行されるメソッドを”ライフサイクルメソッド”と呼ぶ
        tableView.dataSource = self
        tableView.delegate = self
        // フッター指定
        // tableView.tableFooterView = UIView()
        setMemoData()
        setNavigationBarButton()
    }
    
    func setMemoData() {
        for i in 1...5 {
            let memoDataModel = MemoDataModel()
            memoDataModel.text = "このメモは\(i)番目のメモです。"
            memoDataModel.recordDate = Date()
            memoDataList.append(memoDataModel)
        }
    }
    
    @objc func tapAddButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memoDetailViewController = storyboard.instantiateViewController(identifier: "MemoDetailViewController") as! MemoDetailViewController
        navigationController?.pushViewController(memoDetailViewController, animated: true)
    }
    
    func setNavigationBarButton() {
        let buttonActionSelector: Selector = #selector(tapAddButton)
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: buttonActionSelector)
        navigationItem.rightBarButtonItem = rightBarButton
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoDataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        // indexPath.row セルのインデックス番号（通し番号0から）が順番に渡される
        let memoDataModel: MemoDataModel = memoDataList[indexPath.row]
        // メモの内容
        cell.textLabel?.text = memoDataModel.text
        // 日付（サブタイトル）
        cell.detailTextLabel?.text = dateFormat.string(from: memoDataModel.recordDate)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memoDetailViewController = storyboard.instantiateViewController(identifier: "MemoDetailViewController") as! MemoDetailViewController
        let memoData = memoDataList[indexPath.row]
        memoDetailViewController.configure(memo: memoData)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(memoDetailViewController, animated: true)
    }
}
