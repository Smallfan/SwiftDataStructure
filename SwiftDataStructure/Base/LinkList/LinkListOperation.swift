//
//  LinkListOperation.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/2.
//

import Foundation

protocol LinkListOperation {
    associatedtype E: Equatable
    
    
    
    func append(atHead element: E)
    func append(atTail element: E)
    
    func insert(element: E, i: Int)
//    func update(element: E, i: Int)
    
//    func index(i: Int) -> E?
//    func contains(element: E) -> Bool
//    
//    func remove(i: Int) -> E?
//    func removeFirst() -> E?
//    func removeLast() -> E?
//    func removeAll()
}
