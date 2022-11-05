//
//  DivideConquerAlgs.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/6.
//

import Foundation

class DivideConquerAlgs {
    
    // LC08.06.
    func hanota(_ A: inout [Int], _ B: inout [Int], _ C: inout [Int]) {
        let n = A.count
        move(n, &A, &B, &C)
    }
    
    private func move(_ n: Int, _ A: inout [Int], _ B: inout [Int], _ C: inout [Int]) {
        if n == 1 {
            C.append(A.removeLast())
            return
        }
        
        move(n - 1, &A, &C, &B)
        C.append(A.removeLast())
        move(n - 1, &B, &A, &C)
    }
    
    
    
}
