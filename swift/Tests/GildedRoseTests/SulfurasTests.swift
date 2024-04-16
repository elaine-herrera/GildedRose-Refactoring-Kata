//
//  SulfurasTests.swift
//
//
//  Created by Elaine Herrera on 16/4/24.
//

@testable import GildedRose
import XCTest

class SulfurasTests: XCTestCase {
    
    func testSulfurasQualityAndSellIn() throws {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 4, quality: 80)]
        let app = GildedRose(items: items)
        
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].sellIn, 4)
        XCTAssertEqual(app.items[0].quality, 80)
    }
}

