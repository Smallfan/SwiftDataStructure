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
func mergeTwoLists(l1: SingleLinkList<Int>, l2: SingleLinkList<Int>) -> SingleLinkList<Int> {
    let chain = SingleLinkList<Int>(head: SingleLinkNode(data: -1))
    var p = chain.head!
    var p1: SingleLinkNode? = l1.head
    var p2: SingleLinkNode? = l2.head
    
    while p1 != nil && p2 != nil {
        if p1!.data < p2!.data {
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
func partitionLinkList(list: SingleLinkList<Int>, x: Int) -> SingleLinkList<Int> {
    let l1 = SingleLinkList<Int>(head: SingleLinkNode(data: -1))
    let l2 = SingleLinkList<Int>(head: SingleLinkNode(data: -1))
    var p1 = l1.head, p2 = l2.head
    var p = list.head
    
    while p != nil {
        if p!.data >= x {
            p2!.next = p
            p2 = p2?.next
        } else {
            p1!.next = p
            p1 = p1?.next
        }
        
        let temp = p!.next
        p!.next = nil
        p = temp
    }
    
    p1!.next = l2.head
    return l1
}

/// 合并K个有序单链表(LC23)
/// - Parameter lists: 单链表数组
/// - Returns: 合并结果
func mergeKLists(lists: [SingleLinkList<Int>]) -> SingleLinkList<Int>? {
    if lists.count == 0 { return nil }
    
    let chain = SingleLinkList<Int>(head: SingleLinkNode(data: -1))
    var p = chain.head!
    
    // TODO
    
    return chain
}
