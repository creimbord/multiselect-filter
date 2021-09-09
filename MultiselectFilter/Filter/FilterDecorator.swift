//
//  FilterDecorator.swift
//  MultiselectFilter
//
//  Created by Родион on 09.09.2021.
//

import Foundation

protocol PhoneFilter {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone]
}

// MARK: - BaseFilter
class PhoneBaseFilter: PhoneFilter {
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        return phones
    }
}

// MARK: - Base Deacorator
class PhoneFilterDecorator: PhoneFilter {
    private let phoneFilter: PhoneFilter
    
    init(phoneFilter: PhoneFilter) {
        self.phoneFilter = phoneFilter
    }
    
    func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        return phoneFilter.filter(phones: phones, by: specs)
    }
}

// MARK: - PhoneModelFilter
final class PhoneModelFilter: PhoneFilterDecorator {
    override func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let filter = Filter(strategy: ModelFilter())
        let appliedFilter = super.filter(phones: phones, by: specs)
        let filteredPhones = filter.applyFilters(to: appliedFilter, withSpecs: specs)
        return filteredPhones
    }
}

// MARK: - PhonePriceFilter
final class PhonePriceFilter: PhoneFilterDecorator {
    override func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let filter = Filter(strategy: PriceFilter())
        let appliedFilter = super.filter(phones: phones, by: specs)
        let filteredPhones = filter.applyFilters(to: appliedFilter, withSpecs: specs)
        return filteredPhones
    }
}

// MARK: - PhoneScreenSizeFilter
final class PhoneScreenSizeFilter: PhoneFilterDecorator {
    override func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let filter = Filter(strategy: ScreenSizeFilter())
        let appliedFilter = super.filter(phones: phones, by: specs)
        let filteredPhones = filter.applyFilters(to: appliedFilter, withSpecs: specs)
        return filteredPhones
    }
}

// MARK: - PhoneProcessorFilter
final class PhoneProcessorFilter: PhoneFilterDecorator {
    override func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let filter = Filter(strategy: ProcessorFilter())
        let appliedFilter = super.filter(phones: phones, by: specs)
        let filteredPhones = filter.applyFilters(to: appliedFilter, withSpecs: specs)
        return filteredPhones
    }
}

// MARK: - PhoneMemoryFilter
final class PhoneMemoryFilter: PhoneFilterDecorator {
    override func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let filter = Filter(strategy: MemoryFilter())
        let appliedFilter = super.filter(phones: phones, by: specs)
        let filteredPhones = filter.applyFilters(to: appliedFilter, withSpecs: specs)
        return filteredPhones
    }
}

// MARK: - PhoneDiskSpaceFilter
final class PhoneDiskSpaceFilter: PhoneFilterDecorator {
    override func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let filter = Filter(strategy: DiskSpaceFilter())
        let appliedFilter = super.filter(phones: phones, by: specs)
        let filteredPhones = filter.applyFilters(to: appliedFilter, withSpecs: specs)
        return filteredPhones
    }
}

// MARK: - PhoneColorFilter
final class PhoneColorFilter: PhoneFilterDecorator {
    override func filter(phones: [Phone], by specs: [Specification]) -> [Phone] {
        let filter = Filter(strategy: ColorFilter())
        let appliedFilter = super.filter(phones: phones, by: specs)
        let filteredPhones = filter.applyFilters(to: appliedFilter, withSpecs: specs)
        return filteredPhones
    }
}
