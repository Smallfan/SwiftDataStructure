//
//  SingleLinkList.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/2.
//

import Foundation

class SingleLinkList<E: Equatable> {
    var head: LinkNode<E>?
    private(set) var count = 0
    private func _node(_ index: Int) -> LinkNode<E>? {
        guard index < count else {
            return nil
        }
        
        if index == 0 { return head }
        var curNode = head
        var curIndex = index
        
        while curIndex > 0 {
            curNode = curNode?.next
            curIndex -= 1
        }
        return curNode
    }
    

    
    func linkListPrint() -> [E] {
        var nodes = [E]()
        var curNode = head
        while curNode != nil {
            nodes.append(curNode!.data)
            curNode = curNode?.next
        }
        
        print("linkedListPrint ==== \(nodes)")
        return nodes
    }
}

extension SingleLinkList: LinkListOperation {
    func append(atHead element: E) {
        if let tail = _node(count - 1) {
            tail.next = LinkNode(data: element)
            count += 1
        }
    }
    
    func append(atTail element: E) {
        if let tail = _node(count - 1) {
            tail.next = LinkNode(data: element)
            count += 1
        }
    }
    
    func insert(element: E, i: Int) {
        guard i <= count else { return }
        
        if i == 0 {
            append(atHead: element)
        } else if i == count {
            append(atTail: element)
        } else {
            if let curNode = _node(i - 1) {
                let insertNode = LinkNode(data: element)
                insertNode.next = curNode.next
                curNode.next = insertNode
                count += 1
            }
        }
    }
    
//    func update(element: E, i: Int) {
//        <#code#>
//    }
//
//    func index(i: Int) -> E? {
//        <#code#>
//    }
//
//    func contains(element: E) -> Bool {
//        <#code#>
//    }
//
//    func remove(i: Int) -> E? {
//        <#code#>
//    }
//
//    func removeFirst() -> E? {
//        <#code#>
//    }
//
//    func removeLast() -> E? {
//        <#code#>
//    }
//
//    func removeAll() {
//        <#code#>
//    }
    
}
