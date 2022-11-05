//
//  SingleLinkListAlgs.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/3.
//

import Foundation

class SingleLinkListAlgs {
    
    // LC21
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let chain = ListNode(-1)
        var p = chain
        var p1: ListNode? = list1
        var p2: ListNode? = list2
        
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

    // LC86
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let l1 = ListNode(-1)
        let l2 = ListNode(-1)
        var p1: ListNode? = l1, p2: ListNode? = l2
        var p: ListNode? = head
        
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

    // LC23
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let chain = ListNode(-1)
        var p: ListNode? = chain
        
        // TODO
        
        return chain
    }

    // 剑指offer 22
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var p1: ListNode? = head, p2: ListNode? = head
        
        for _ in 0 ..< k {
            p1 = p1?.next
        }
        
        while p1 != nil {
            p2 = p2?.next
            p1 = p1?.next
        }
        
        return p2
    }

    // LC876
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head, fast: ListNode? = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }

    // LC19
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let chain = ListNode(-1)
        chain.next = head
        
        guard let nNode = getKthFromEnd(chain, n + 1) else { return nil }
        
        nNode.next = nNode.next?.next
        return chain.next
    }

    // LC141
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil { return false }
        var slow: ListNode? = head, fast: ListNode? = head?.next
        
        while slow !== fast {
            if fast == nil || fast?.next == nil { return false }
             
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return true
    }
    
    
}
