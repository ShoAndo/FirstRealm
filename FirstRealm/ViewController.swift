//
//  ViewController.swift
//  FirstRealm
//
//  Created by 安藤奨 on 2019/07/30.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
//    テーブルに表示するデータを
    var items:[Item] = []
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
//        realmからitem全件取得する。ほぼ定型文
        let realm = try! Realm()
        items = realm.objects(Item.self).reversed()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    @IBAction func addItem(_ sender: UIButton) {
//        新しいItemクラスのインスタンスを作成← 新たな行を作る
        let item = Item()
//        Itemクラスに入力されたタイトルを設定
        item.title = textField.text
//        realmに保存する.定型文。変数のitemだけ変わる
//        Objectを継承したものだけがaddできる
        let realm = try! Realm()
        
        try! realm.write{
            realm.add(item)
        }
//        最新のItem一覧を取得
        items = realm.objects(Item.self).reversed()
        
//        テーブルを更新
        tableView.reloadData()
        
//        テキストフィールドをからにする
        textField.text = ""
        
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//        表示するItemクラスを取得
        let item = items[indexPath.row]
//        セルのラベルにItemクラスのタイトルを設定
        cell.textLabel?.text = item.title
        
        return cell
        
        
    }
    
    
}

