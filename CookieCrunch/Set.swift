//
//  Set.swift
//  CookieCrunch
//
//  Created by Tyler Simko on 9/24/14.
//  Copyright (c) 2014 O8 Labs. All rights reserved.
//

import Foundation

struct Set<T: Hashable>: SequenceType, Printable {
    
    //SequenceType required generate()
    
    private var dictionary = Dictionary<T, Bool>()
    
    mutating func addElement(newElement: T) {
        dictionary[newElement] = true
    }
    
    mutating func removeElement(element: T) {
        dictionary[element] = nil
    }
    
    func containsElement(element: T) -> Bool {
        return dictionary[element] != nil
    }
    
    func allElements() -> [T] {
        return Array(dictionary.keys)
    }
    
    var count: Int {
        return dictionary.count
    }
    
    func unionSet(otherSet: Set<T>) -> Set<T> {
        var combined = Set<T>()
        
        for obj in dictionary.keys {
            combined.dictionary[obj] = true
        }
        
        for obj in otherSet.dictionary.keys {
            combined.dictionary[obj] = true
        }
        
        return combined
    }
    
    //allows you to use the set in for-in loops.
    
    func generate() -> IndexingGenerator<Array<T>> {
        return allElements().generate()
    }
    
    var description: String {
        return dictionary.description
    }

}