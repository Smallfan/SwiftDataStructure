//
//  SingleLinkListAlgs.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/3.
//

import Foundation


/// 合并两个有序单链表, 保持有序
/// - Parameters:
///   - l1: 第一个单链表
///   - l2: 第二个单链表
/// - Returns: 合并结果
func mergeTwoLists(l1: SingleLinkList<Int>, l2: SingleLinkList<Int>) -> SingleLinkList<Int> {
    let chain = SingleLinkList<Int>(head: SingleLinkNode(data: 0))
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
        
        if p.next != nil {
            p = p.next!
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
