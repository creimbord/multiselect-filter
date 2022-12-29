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
    
    func applyFilter(to phones: [Phone], withSpecs specs: [Specification]) -> [Phone] {
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
        let modelSpecs = Set(specs.compactMap { (spec) -> String? in
            if case let .model(name) = spec { return name }; return nil
        })
        return phones.filter { modelSpecs.contains($0.model) }
    }
}

// MARK: - PriceFilter
final class PriceFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let priceSpecs = Set(specs.compactMap { (spec) -> Int? in
            if case let .price(price) = spec { return price }; return nil
        })
        return phones.filter { priceSpecs.contains($0.price) }
    }
}

// MARK: - ScreenSizeFilter
final class ScreenSizeFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let screenSizeSpecs = Set(specs.compactMap { (spec) -> Double? in
            if case let .screenSize(size) = spec { return size }; return nil
        })
        return phones.filter { screenSizeSpecs.contains($0.screenSize) }
    }
}

// MARK: - ProcessorFilter
final class ProcessorFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let processorSpecs = Set(specs.compactMap { (spec) -> String? in
            if case let .processor(name) = spec { return name }; return nil
        })
        return phones.filter { processorSpecs.contains($0.processor) }
    }
}

// MARK: - MemoryFilter
final class MemoryFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let memorySpecs = Set(specs.compactMap { (spec) -> Int? in
            if case let .memory(amount) = spec { return amount }; return nil
        })
        return phones.filter { memorySpecs.contains($0.memory) }
    }
}

// MARK: - DiskSpaceFilter
final class DiskSpaceFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let diskSpaceSpecs = Set(specs.compactMap { (spec) -> Int? in
            if case let .diskSpace(space) = spec { return space }; return nil
        })
        return phones.filter { diskSpaceSpecs.contains($0.diskSpace) }
    }
}

// MARK: - ColorFilter
final class ColorFilter: FilterStrategy {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let colorSpecs = Set(specs.compactMap { (spec) -> String? in
            if case let .color(name) = spec { return name }; return nil
        })
        return phones.filter { colorSpecs.contains($0.color) }
    }
}
