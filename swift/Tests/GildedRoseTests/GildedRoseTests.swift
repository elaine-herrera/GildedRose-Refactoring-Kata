@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func testQualityMainExamples() {
        let items = [
            Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
            Item(name: "Aged Brie", sellIn: 2, quality: 0),
            Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
        ]
        let app = GildedRose(items: items)
        
        let quality = [19, 1, 6, 80, 80, 21, 50, 50]
        
        app.updateQuality()
        
        for (result, expected) in zip(items, quality) {
            XCTAssertEqual(result.quality, expected)
        }
    }
}
