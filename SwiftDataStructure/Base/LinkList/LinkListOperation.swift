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
    
    func insert(element: E, at index: Int)
    func update(element: E, at index: Int)
    
    func index(of i: Int) -> E?
    func contains(_ element: E) -> Bool
    
    func remove(at index: Int) -> E?
    func removeFirst() -> E?
    func removeLast() -> E?
    func removeAll()
}
