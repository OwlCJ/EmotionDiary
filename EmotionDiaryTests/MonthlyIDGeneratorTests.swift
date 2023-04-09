//
//  MonthlyIDGeneratorTests.swift
//  EmotionDiaryTests
//
//  Created by 박철진 on 2023/04/10.
//

import XCTest
@testable import EmotionDiary

final class MonthlyIDGeneratorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    // test_<테스트 대상>_<동작>_<조건>
    func test_MIDGenerator_whenMIDrequested_withMoodDiary() {
        let sut = MonthlyIDGenerator()
        let diary = MoodDiary(date: "2022-04-01 00:04:01", text: "My Diary", mood: .good)
        
        let id = sut.monthlyID(with: diary)
        
        let expected = "2022-4"
        XCTAssertEqual(id, expected)
    }

}
