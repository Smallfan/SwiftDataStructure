//
//  SingleLinkNode.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/2.
//

import Foundation

class SingleLinkNode<E: Equatable & Comparable> {
    var val: E
    var next: SingleLinkNode?
    
    
    
    init(val: E) {
        self.val = val
    }
    
    static func == (lhs: SingleLinkNode, rhs: SingleLinkNode) -> Bool {
        return lhs.val == rhs.val
    }
}
