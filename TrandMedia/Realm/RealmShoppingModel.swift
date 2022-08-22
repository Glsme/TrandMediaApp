//
//  RealmShoppingModel.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/08/22.
//

import Foundation
import RealmSwift

class RealmShoppingModel: Object {
    @Persisted var shoppingContent: String
    @Persisted var checking: Bool
    @Persisted var like: Bool
    
    convenience init(shoppingContent: String, checking: Bool, like: Bool) {
        self.init()
        self.shoppingContent = shoppingContent
        self.checking = false
        self.like = false
    }
}
