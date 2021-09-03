//
//  Specification.swift
//  MultiselectFilter
//
//  Created by Родион on 03.09.2021.
//

import Foundation

enum Specification {
    case model(String)
    case price(Int)
    case screenSize(Double)
    case processor(String)
    case memory(Int)
    case diskSpace(Int)
    case color(String)
}
