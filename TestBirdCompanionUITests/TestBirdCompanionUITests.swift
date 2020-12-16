//
//  TestBirdCompanionUITests.swift
//  TestBirdCompanionUITests
//
//  Created by ramil on 16.12.2020.
//

import XCTest

class TestBirdCompanionUITests: XCTestCase {

    let testbirds = XCUIApplication(bundleIdentifier: "com.testbirds.companion")
    
    override func setUp() {
        testbirds.launch()
    }
    
    override func tearDown() {
        testbirds.terminate()
    }
    
    func testTestBirdsSwitchingByTabs() throws {
        _ = testbirds.wait(for: .runningForeground, timeout: 5)

        for _ in 1...10 {
            testbirds.buttons["Home"].tap()
            testbirds.buttons["Record"].tap()
            testbirds.buttons["Notifications"].tap()
            testbirds.buttons["More"].tap()
        }
    }
    
    func testTestBirdsSettings() throws {
        _ = testbirds.wait(for: .runningForeground, timeout: 5)
        
        testbirds.buttons["Record"].tap()
        XCTAssertTrue(testbirds.staticTexts["Let's roll!"].exists)
        XCTAssertTrue(testbirds.staticTexts["Tap to start screenrecording!"].exists)
        XCTAssertTrue(testbirds.staticTexts["9,82 GB available, 06h 35m can be recorded"].exists)
        XCTAssertTrue(testbirds.staticTexts["Take a screenshot anytime"].exists)
        XCTAssertTrue(testbirds.staticTexts["Press the Side button and the Home button at the same time."].exists)
        
        XCTAssertTrue(testbirds.staticTexts["LEARN MORE"].exists)
        XCTAssertTrue(testbirds.staticTexts["5 tips on how to make the best screen record while testing."].exists)
        
        for _ in 1...10 {
            testbirds.buttons["Settings"].tap()
            //print(testbirds.description)
            //print(testbirds.debugDescription)
            
            XCTAssertTrue(testbirds.staticTexts["AUDIO"].exists)
            XCTAssertTrue(testbirds.staticTexts["Record Microphone"].exists)
            XCTAssertTrue(testbirds.staticTexts["If enabled, you can record your voice and the outside sound from your phone."].exists)
            XCTAssertTrue(testbirds.staticTexts["Record Device Audio"].exists)
            XCTAssertTrue(testbirds.staticTexts["If enabled, the sound of apps and games are recorded."].exists)
            XCTAssertTrue(testbirds.staticTexts["IMPORTANT: When you set your phone to Silent mode you can’t record any audio."].exists)
            
            testbirds.switches["Record Microphone, If enabled, you can record your voice and the outside sound from your phone."].tap()
            testbirds.switches["Record Device Audio, If enabled, the sound of apps and games are recorded."].tap()
            
            testbirds.buttons["Back"].tap()
        }
    }
    
    func testRecordingGuidlines() {
        _ = testbirds.wait(for: .runningForeground, timeout: 5)
        
        testbirds.buttons["Record"].tap()
        
        for _ in 1...3 {
            testbirds.staticTexts["5 tips on how to make the best screen record while testing."].tap()
            //print(testbirds.description)
            //print(testbirds.debugDescription)
            
            XCTAssertTrue(testbirds.staticTexts["When you record your microphone, please speak loudly, clearly and formulate every single problem."].exists)
            XCTAssertTrue(testbirds.staticTexts["Tell us the pleasant experience too. Talk about everything that appears very comfortable and is simple to handle."].exists)
            XCTAssertTrue(testbirds.staticTexts["If you reach a point where you do not know what to do or how to proceed, don’t worry, just mention this in your video."].exists)
            XCTAssertTrue(testbirds.staticTexts["Focus on the specific use-case, perform the required tasks and answer the given questions."].exists)
            //XCTAssertTrue(testbirds.staticTexts["Once you finished, the video is saved to your device. Please name the record that describes best the whole use-case. If you think you are ready, you can upload it straight from the application."].exists)
            
            testbirds.swipeUp()
            testbirds.swipeDown()
            
            testbirds.buttons["Back"].tap()
        }
    }
    
    func testTestBirdsOpenRecordingScreen() throws {
        _ = testbirds.wait(for: .runningForeground, timeout: 5)
        testbirds.buttons["Record"].tap()
        
        _ = testbirds.wait(for: .runningForeground, timeout: 5)
        testbirds.buttons["Open Recording Screen"].tap()
        
        _ = testbirds.wait(for: .runningForeground, timeout: 5)
        print(testbirds.description)
        print(testbirds.debugDescription)
        
    }
}
