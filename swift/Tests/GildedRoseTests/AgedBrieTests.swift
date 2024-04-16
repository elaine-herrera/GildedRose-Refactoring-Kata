//
//  AgedBrieTests.swift
//
//
//  Created by Elaine Herrera on 16/4/24.
//

@testable import GildedRose
import XCTest

class AgedBrieTests: XCTestCase {
    
    func testAgedBrieWhenOneDay() throws {
        let sellIn = 3
        let quality = 1
        let items = [Item(name: "Aged Brie", sellIn: sellIn, quality: quality)]
        let app = GildedRose(items: items)
        
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].sellIn, sellIn - 1)
        XCTAssertEqual(app.items[0].quality, quality + 1)
    }
    
    func testAgedBrieWhenDaysLestThanSellIn() throws {
        let days = 3
        let items = [Item(name: "Aged Brie", sellIn: 4, quality: 1)]
        let app = GildedRose(items: items)
        
        for _ in 0 ..< days {
            app.updateQuality()
        }
        
        XCTAssertEqual(app.items[0].sellIn, 1)
        XCTAssertEqual(app.items[0].quality, days + 1)
    }
    
    func testAgedBrieWhenDaysEqualSellIn() throws {
        let days = 5
        let items = [Item(name: "Aged Brie", sellIn: days, quality: 1)]
        let app = GildedRose(items: items)
        
        for _ in 0 ..< days {
            app.updateQuality()
        }
        
        XCTAssertEqual(app.items[0].sellIn, 0)
        XCTAssertEqual(app.items[0].quality, days + 1)
    }
    
    func testAgedBrieWhenDaysGreaterThanSellIn() throws {
        let days = 5
        let sellIn = 3
        let quality = 1
        let items = [Item(name: "Aged Brie", sellIn: sellIn, quality: quality)]
        let app = GildedRose(items: items)
        
        for _ in 0 ..< days {
            app.updateQuality()
        }
        
        XCTAssertEqual(app.items[0].sellIn, 3 - days)
        XCTAssertEqual(app.items[0].quality, quality + sellIn + 2 * (days - sellIn))
    }
    
    func testAgedBrieWhenQualityIncreaseOver50() throws {
        let days = 25
        let items = [Item(name: "Aged Brie", sellIn: 3, quality: 10)]
        let app = GildedRose(items: items)
        
        for _ in 0 ..< days {
            app.updateQuality()
        }
        
        XCTAssertEqual(app.items[0].sellIn, 3 - days)
        XCTAssertEqual(app.items[0].quality, 50)
    }
}

