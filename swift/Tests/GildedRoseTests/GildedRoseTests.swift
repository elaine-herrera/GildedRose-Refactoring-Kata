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
            Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6),
            Item(name: "Conjured Mana Cake", sellIn: 3, quality: 1)
        ]
        let app = GildedRose(items: items)
        
        let quality = [19, 1, 6, 80, 80, 21, 50, 50, 4, 0]
        
        app.updateQuality()
        
        for (result, expected) in zip(items, quality) {
            XCTAssertEqual(result.quality, expected)
        }
    }
    
    func testEmptyInventory(){
        let items: [Item] = []
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertTrue(app.items.isEmpty)
    }
    
    func testItemQualityNegative() throws {
        let sellIn = 5
        let quality = -3
        let items = [Item(name: "Some", sellIn: sellIn, quality: quality)]
        let app = GildedRose(items: items)
        
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].sellIn, sellIn - 1)
        XCTAssertEqual(app.items[0].quality, quality)
    }
    
    func testItemQualityZero() throws {
        let sellIn = 5
        let items = [Item(name: "Some", sellIn: sellIn, quality: 0)]
        let app = GildedRose(items: items)
        
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].sellIn, sellIn - 1)
        XCTAssertEqual(app.items[0].quality, 0)
    }
    
    func testItemQualityDecresase() throws {
        let sellIn = 5
        let quality = 2
        let items = [Item(name: "Some", sellIn: sellIn, quality: quality)]
        let app = GildedRose(items: items)
        
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].sellIn, sellIn - 1)
        XCTAssertEqual(app.items[0].quality, quality - 1)
    }
    
    func testItemQualityIsZeroAfterSellIn() throws {
        let sellIn = 0
        let quality = 2
        let items = [Item(name: "Some", sellIn: sellIn, quality: quality)]
        let app = GildedRose(items: items)
        
        app.updateQuality()
        
        XCTAssertEqual(app.items[0].sellIn, sellIn - 1)
        XCTAssertEqual(app.items[0].quality, 0)
    }
    
    func testItemQualityDropTwiceAfterSellIn() throws {
        let days = 5
        let sellIn = days - 1
        let quality = days + 1
        let items = [Item(name: "Some", sellIn: sellIn, quality: quality)]
        let app = GildedRose(items: items)
        
        for _ in 0 ..< days {
            app.updateQuality()
        }
        
        XCTAssertEqual(app.items[0].sellIn, sellIn - days)
        XCTAssertEqual(app.items[0].quality, quality - sellIn - 2 * (days - sellIn))
    }
}
