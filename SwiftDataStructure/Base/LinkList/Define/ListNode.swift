//
//  SingleLinkNode.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/2.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    
    
    
    init(_ val: Int) {
        self.val = val
    }
}

extension ListNode: Comparable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }
    
    public static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val < rhs.val
    }
}
