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
         
        return chain.next
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
        if lists.count == 0 {
            return nil
        }
        
        let chain = ListNode(-1)
        var p = chain
        
        let pg = PriorityQueue<ListNode>(direction: .minHeap)
        for head in lists {
            if head != nil {
                pg.add(head!)
            }
        }
        
        while !pg.isEmpty() {
            let node = pg.pop()
            p.next = node
            if node?.next != nil {
                pg.add(node!.next!)
            }
            p = p.next!
        }
        
        return chain.next
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
    
    // LC160
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var p1 = headA, p2 = headB
        while p1 !== p2 {
            if p1 == nil {
                p1 = headB
            } else {
                p1 = p1?.next
            }
            
            if p2 == nil {
                p2 = headA
            } else {
                p2 = p2?.next
            }
        }
        
        return p1
    }
    
    // 剑指offerII 22
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return nil }
        var slow = head, fast = head
        
        while fast != nil || fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                break
            }
        }
        
        if fast == nil || fast?.next == nil {
            return nil
        }
        
        slow = head
        while slow !== fast {
            fast = fast?.next
            slow = slow?.next
        }
        
        return slow
    }
    
    // LC206
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let last = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return last
    }
    
    var flag: ListNode? = nil
    func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n == 1 {
            flag = head?.next
            return head
        }
        
        let last = reverseN(head?.next, n - 1)
        head?.next?.next = head
        head?.next = flag
        return last
    }
    
    // LC92
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == 1 {
            return reverseN(head, right)
        }
        
        head?.next = reverseBetween(head?.next, left - 1, right - 1)
        return head
    }
    
    func reverseBetween2(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
        var pre: ListNode?
        var cur = a
        var next = a
        
        while cur !== b {
            next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        
        return pre
    }
    
    // LC25
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var a = head, b = head
        for _ in 0..<k {
            if b == nil {
                return head
            }
            b = b?.next
        }
        
        let newHead = reverseBetween2(a, b)
        a?.next = reverseKGroup(b, k)
        return newHead
    }
    
    // LC83
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var slow = head, fast = head
        while fast != nil {
            if slow?.val != fast?.val {
                slow?.next = fast
                slow = slow?.next
            }
            fast = fast?.next
        }
        
        slow?.next = nil
        return head
    }
}
