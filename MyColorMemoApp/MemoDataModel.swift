//
//  MemoDataModel.swift
//  MyColorMemoApp
//
//  Created by fyky on 2022/01/02.
//

import Foundation
import RealmSwift

class MemoDataModel: Object {
    // データを一意に識別するための識別子
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var text: String = ""
    @objc dynamic var recordDate: Date = Date()
}
