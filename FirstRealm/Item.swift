//
//  Item.swift
//  FirstRealm
//
//  Created by 安藤奨 on 2019/07/30.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import RealmSwift

//エクセルで[Item]というシートを作成するイメージ
class Item: Object{
//    タイトルを保存する列のイメージ
    @objc dynamic var title:String? = nil
    
//    登録日時を保存する列のイメージ
    @objc dynamic var created = Date()
    
    
}
