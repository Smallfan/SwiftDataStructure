//
//  SingleLinkListAlgs.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/3.
//

import Foundation


/// 合并两个有序单链表, 保持有序(LC21)
/// - Parameters:
///   - l1: 第一个单链表
///   - l2: 第二个单链表
/// - Returns: 合并结果
func mergeTwoLists(l1: SingleLinkNode<Int>, l2: SingleLinkNode<Int>) -> SingleLinkNode<Int> {
    let chain = SingleLinkNode(val: -1)
    var p = chain
    var p1: SingleLinkNode<Int>? = l1
    var p2: SingleLinkNode<Int>? = l2
    
    while p1 != nil && p2 != nil {
        if p1!.val < p2!.val {
            p.next = p1
            p1 = p1?.next
        } else {
            p.next = p2
            p2 = p2?.next
        }
        
        if let next = p.next {
            p = next
        }
    }
    
    if (p1 != nil) {
         p.next = p1
     }
     
     if (p2 != nil) {
         p.next = p2
     }
     
     return chain
}

/// 单链表分解(LC86)
/// - Parameters:
///   - l1: 单链表
///   - x: 分解条件值
func partitionLinkList(list: SingleLinkNode<Int>, x: Int) -> SingleLinkNode<Int>? {
    let l1 = SingleLinkNode(val: -1)
    let l2 = SingleLinkNode(val: -1)
    var p1: SingleLinkNode<Int>? = l1, p2: SingleLinkNode<Int>? = l2
    var p: SingleLinkNode<Int>? = list
    
    while p != nil {
        if (p?.val)! >= x {
            p2?.next = p
            p2 = p2?.next
        } else {
            p1?.next = p
            p1 = p1?.next
        }
        
        let temp = p!.next
        p!.next = nil
        p = temp
    }
    
    p1?.next = l2.next
    return l1
}

/// 合并K个有序单链表(LC23)
/// - Parameter lists: 单链表数组
/// - Returns: 合并结果
func mergeKLists(lists: [SingleLinkNode<Int>]) -> SingleLinkNode<Int>? {
    let chain = SingleLinkNode(val: -1)
    var p: SingleLinkNode<Int>? = chain
    
    // TODO
    
    return chain
}

/// 链表中倒数第k个节点
/// - Parameter list: 单链表
/// - k: 第k个结点
/// - Returns: 合并结果
func getKthFromEnd(list: SingleLinkNode<Int>, k: Int) -> SingleLinkNode<Int>? {
    var p1: SingleLinkNode<Int>? = list, p2: SingleLinkNode<Int>? = list
    
    for _ in 0 ..< k {
        p1 = p1?.next
    }
    
    while p1 != nil {
        p2 = p2?.next
        p1 = p1?.next
    }
    
    return p2
}

/// 链表的中间结点
/// - Parameter list: 单链表
/// - Returns: 中间结点
func getMiddleNode(list: SingleLinkNode<Int>) -> SingleLinkNode<Int>? {
    var slow: SingleLinkNode<Int>? = list, fast: SingleLinkNode<Int>? = list
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return slow
}

/// 删除链表的倒数第 N 个结点
/// - Parameter list: 单链表
/// - n: 第n个结点
/// - Returns: 合并结果
func removeKthFromEnd(list: SingleLinkNode<Int>, n: Int) -> SingleLinkNode<Int>? {
    let chain = SingleLinkNode(val: -1)
    chain.next = list
    
    let nNode = getKthFromEnd(list: chain, k: n + 1)
    guard let nNode else { return nil }
    
    nNode.next = nNode.next?.next
    return chain
}
