//
//  Swap.swift
//  CookieCrunch
//
//  Created by Tyler Simko on 9/24/14.
//  Copyright (c) 2014 O8 Labs. All rights reserved.
//

import Foundation

struct Swap: Printable, Hashable {
    let cookieA: Cookie
    let cookieB: Cookie
    
    var hashValue: Int {
        return cookieA.hashValue ^ cookieB.hashValue
    }
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }
}

func ==(lhs: Swap, rhs: Swap) -> Bool {
    return (lhs.cookieA == rhs.cookieA && lhs.cookieB == rhs.cookieB) ||
        (lhs.cookieB == rhs.cookieA && lhs.cookieA == rhs.cookieB)
}