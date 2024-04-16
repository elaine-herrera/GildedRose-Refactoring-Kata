//
//  BackstageTests.swift
//
//
//  Created by Elaine Herrera on 16/4/24.
//

@testable import GildedRose
import XCTest

class BackstageTests: XCTestCase {
    
    func testBackStageIncreaseBy2() throws {
        let days = 5
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 20)]
        let app = GildedRose(items: items)
        
        for _ in 0 ..< days {
            app.updateQuality()
        }
        
        XCTAssertEqual(app.items[0].sellIn, 10 - days)
        XCTAssertEqual(app.items[0].quality, 20 + 2 * days)
    }
    
    func testBackStageIncreaseBy3() throws {
        let days = 6
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 20)]
        let app = GildedRose(items: items)
        
        for _ in 0 ..< days {
            app.updateQuality()
        }
        
        XCTAssertEqual(app.items[0].sellIn, 10 - days)
        XCTAssertEqual(app.items[0].quality, 20 + 2 * days + 1)
    }
    
    func testBackStageDropsAfterConcert() throws {
        let days = 5
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: days - 1, quality: 20)]
        let app = GildedRose(items: items)
        
        for _ in 0 ..< days {
            app.updateQuality()
        }
        
        XCTAssertEqual(app.items[0].sellIn, -1)
        XCTAssertEqual(app.items[0].quality, 0)
    }
}

