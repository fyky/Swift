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
    override func viewDidLoad() {
        // このクラスの画面が表示される際に呼び出されるメソッド
        // 画面の表示・非表示に応じて実行されるメソッドを”ライフサイクルメソッド”と呼ぶ
        print("HomeViewControllerが表示されました")
    }
}
