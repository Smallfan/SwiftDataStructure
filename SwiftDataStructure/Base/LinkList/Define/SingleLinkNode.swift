//
//  SingleLinkNode.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/2.
//

import Foundation

class SingleLinkNode<E: Equatable & Comparable> {
    var data: E
    var next: SingleLinkNode?
    
    
    
    init(data: E) {
        self.data = data
    }
    
    static func == (lhs: SingleLinkNode, rhs: SingleLinkNode) -> Bool {
        return lhs.data == rhs.data
    }
}
