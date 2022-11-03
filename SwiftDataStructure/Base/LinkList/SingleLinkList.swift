//
//  SingleLinkList.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/2.
//

import Foundation

class SingleLinkList<E: Equatable & Comparable> {
    var head: SingleLinkNode<E>?
    var tail: SingleLinkNode<E>?
    private(set) var count = 0
    private func _node(_ index: Int) -> SingleLinkNode<E>? {
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
    
    
    
    init(head: SingleLinkNode<E>) {
        self.head = head
    }
    
    func linkListPrint() -> [E] {
        var nodes = [E]()
        var curNode = head
        
        while curNode != nil {
            nodes.append(curNode!.data)
            curNode = curNode?.next
        }
        
        print("linkListPrint ==== \(nodes)")
        return nodes
    }
}

extension SingleLinkList: LinkListOperation {
    func append(atHead element: E) {
        if head == nil {
            head = SingleLinkNode(data: element)
        } else {
            let newHead = SingleLinkNode(data: element)
            newHead.next = head
            head = newHead
        }
        count += 1
    }
    
    func append(atTail element: E) {
        if tail == nil {
            tail = _node(count - 1)
        }
        
        tail!.next = SingleLinkNode(data: element)
        tail = tail?.next
        count += 1
    }
    
    func insert(element: E, at index: Int) {
        guard index <= count else { return }
        
        if index == 0 {
            append(atHead: element)
        } else if index == count {
            append(atTail: element)
        } else {
            if let curNode = _node(index - 1) {
                let insertNode = SingleLinkNode(data: element)
                insertNode.next = curNode.next
                curNode.next = insertNode
                count += 1
            }
        }
    }
    
    func update(element: E, at index: Int) {
        guard let curNode = _node(index) else {
            fatalError("Index out of range")
        }
        
        curNode.data = element
    }

    func index(of i: Int) -> E? {
        return _node(i)?.data
    }

    func contains(_ element: E) -> Bool {
        guard head != nil else { return false }
        
        var curNode = head
        while curNode != nil {
            if curNode!.data == element {
                return true
            }
            curNode = curNode?.next
        }
        return false
    }

    @discardableResult
    func remove(at index: Int) -> E? {
        guard head != nil else { return nil }
        guard index < count else { return nil }
        
        if index == 0 {
            return removeFirst()
        } else if index == count - 1 {
            return removeLast()
        } else {
            let prevNode = _node(index - 1)
            let data = prevNode?.next?.data
            prevNode?.next = prevNode?.next?.next
            
            count -= 1
            return data
        }
    }

    @discardableResult
    func removeFirst() -> E? {
        let data = head?.data
        if count == 1 {
            head = nil
        } else {
            head = head?.next
        }
        count -= 1
        return data
    }

    @discardableResult
    func removeLast() -> E? {
        guard head != nil else { return nil }
        
        if count == 1 {
            let val = head?.data
            head = nil
            count -= 1
            return val
        } else {
            let prevNode = _node(count - 2)
            let val = prevNode?.next?.data
            prevNode?.next = prevNode?.next?.next
            count -= 1
            return val
        }
    }

    func removeAll() {
        head = nil
        count = 0
    }
    
}
