//
//  InsertionSort.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/2.
//

import Foundation

func insertionSort<T: Comparable>(a: inout [T]) {
    let n = a.count
    for i in 0..<n {
        var min = i
        for j in i+1..<n {
            if a[j] < a[min] {
                min = j
            }
        }
        
        if min != i {
            let temp = a[i]
            a[i] = a[min]
            a[min] = temp
        }
    }
}

fileprivate func test() {
    var a = ["S", "O" , "R", "T", "E", "X", "A", "M", "P", "L", "E"]
    insertionSort(a: &a)
    print(a)
}
