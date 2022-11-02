//
//  LinkNode.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/2.
//

import Foundation

class LinkNode<E: Equatable> {
    var data: E
    var next: LinkNode?
    
    
    
    init(data: E) {
        self.data = data
    }
    
    static func == (lhs: LinkNode, rhs: LinkNode) -> Bool {
        return lhs.data == rhs.data
    }
}
