//
//  FilterStrategy.swift
//  MultiselectFilter
//
//  Created by Родион on 03.09.2021.
//

import Foundation

final class Filter {
    private var strategy: FilterStrategy
    
    init(strategy: FilterStrategy) {
        self.strategy = strategy
    }
    
    func update(strategy: FilterStrategy) {
        self.strategy = strategy
    }
    
    func applyFilters(to phones: [Phone], withSpecs specs: [Specification]) -> [Phone] {
        return strategy.filter(phones: phones, by: specs)
    }
}

// MARK: - FilterStrategy
protocol FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone]
}

// MARK: - ModelFilter
final class ModelFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let modelSpecs = specs.compactMap { (spec) -> String? in
            if case let .model(name) = spec { return name }; return nil
        }
        var filteredPhones = [Phone]()
        
        modelSpecs.forEach { (model) in
            filteredPhones += phones.filter { (phone) -> Bool in
                return phone.model == model
            }
        }
        
        return filteredPhones
    }
}

// MARK: - PriceFilter
final class PriceFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let priceSpecs = specs.compactMap { (spec) -> Int? in
            if case let .price(price) = spec { return price }; return nil
        }
        var filteredPhones = [Phone]()
        
        priceSpecs.forEach { (price) in
            filteredPhones += phones.filter { (phone) -> Bool in
                return phone.price == price
            }
        }
        
        return filteredPhones
    }
}

// MARK: - ScreenSizeFilter
final class ScreenSizeFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let screenSizeSpecs = specs.compactMap { (spec) -> Double? in
            if case let .screenSize(size) = spec { return size }; return nil
        }
        var filteredPhones = [Phone]()
        
        screenSizeSpecs.forEach { (screenSize) in
            filteredPhones += phones.filter { (phone) -> Bool in
                return phone.screenSize == screenSize
            }
        }
        
        return filteredPhones
    }
}

// MARK: - ProcessorFilter
final class ProcessorFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let processorSpecs = specs.compactMap { (spec) -> String? in
            if case let .processor(name) = spec { return name }; return nil
        }
        var filteredPhones = [Phone]()
        
        processorSpecs.forEach { (processor) in
            filteredPhones += phones.filter { (phone) -> Bool in
                return phone.processor == processor
            }
        }
        
        return filteredPhones
    }
}

// MARK: - MemoryFilter
final class MemoryFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let memorySpecs = specs.compactMap { (spec) -> Int? in
            if case let .memory(amount) = spec { return amount }; return nil
        }
        var filteredPhones = [Phone]()
        
        memorySpecs.forEach { (memory) in
            filteredPhones += phones.filter { (phone) -> Bool in
                return phone.memory == memory
            }
        }
        
        return filteredPhones
    }
}

// MARK: - DiskSpaceFilter
final class DiskSpaceFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let diskSpaceSpecs = specs.compactMap { (spec) -> Int? in
            if case let .diskSpace(space) = spec { return space }; return nil
        }
        var filteredPhones = [Phone]()
        
        diskSpaceSpecs.forEach { (diskSpace) in
            filteredPhones += phones.filter { (phone) -> Bool in
                return phone.diskSpace == diskSpace
            }
        }
        
        return filteredPhones
    }
}

// MARK: - ColorFilter
final class ColorFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let colorSpecs = specs.compactMap { (spec) -> String? in
            if case let .model(name) = spec { return name }; return nil
        }
        var filteredPhones = [Phone]()
        
        colorSpecs.forEach { (color) in
            filteredPhones += phones.filter { (phone) -> Bool in
                return phone.color == color
            }
        }
        
        return filteredPhones
    }
}
