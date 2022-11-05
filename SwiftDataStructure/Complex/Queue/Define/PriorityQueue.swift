//
//  PriorityQueue.swift
//  SwiftDataStructure
//
//  Created by Smallfan on 2022/11/3.
//

import Foundation

class PriorityQueue<T: Comparable> {
    enum Direction {
        case minHeap, maxHeap
    }
    
    private var _queue: [T] = []
    private var _direction = Direction.minHeap
    private var _firstAppend = true
    private var _swimCompareFunc: ((T, T) -> Bool)? = nil
    private var _sinkCompareFunc: ((T, T) -> Bool)? = nil
    var count = 0
    
    
    
    init(direction: Direction) {
        _direction = direction
    }

    func add(_ x: T) {
        count += 1
        // 目的: 为了数组从第一位开始使用
        if _firstAppend {
            _firstAppend = false
            _queue.append(x)
            
            self._swimCompareFunc = _greater
            if _direction == .maxHeap {
                self._swimCompareFunc = self._less
            }
            
            self._sinkCompareFunc = _less
            if _direction == .maxHeap {
                self._sinkCompareFunc = self._greater
            }
        }
        _queue.append(x)
        _swim(count)
    }
    
    func pop() -> T? {
        let result = _queue[1]
        _queue[1] = _queue[count]
        _queue.removeLast()
        count -= 1
        _sink(1)
        return result
    }
    
    func isEmpty() -> Bool {
        return _queue.count <= 1
    }
    
    private func _swap(_ i: Int, _ j: Int) {
        let temp = _queue[i]
        _queue[i] = _queue[j]
        _queue[j] = temp
    }
    
    private func _less(_ a: T, _ b: T) -> Bool {
        return a < b
    }
    
    private func _greater(_ a: T, _ b: T) -> Bool {
        return a > b
    }
    
    private func _parent(_ index: Int) -> Int? {
        if index / 2 == 0 {
            return nil
        }
        return index / 2
    }
    
    private func _left(_ index: Int) -> Int? {
        if (index * 2) > count {
            return nil
        }
        return index * 2
    }
    
    private func _right(_ index: Int) -> Int? {
        if (index * 2 + 1) > count {
            return nil
        }
        return index * 2 + 1
    }
    
    private func _swim(_ x: Int) {
        var x = x
        while x > 1, let parent = _parent(x), _swimCompareFunc!(_queue[parent], _queue[x]) {
            _swap(parent, x)
            x = parent
        }
    }
    
    private func _sink(_ x: Int) {
        var x = x
        while let left = _left(x) {
            var max = left
            if let right = _right(x), _sinkCompareFunc!(_queue[right], _queue[max]) {
                max = right
            }
            if _sinkCompareFunc!(_queue[x], _queue[max]) {
                break
            }
            _swap(max, x)
            x = max
        }
    }
}
