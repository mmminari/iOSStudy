//
//  NavigationControllerUITests.m
//  NavigationControllerUITests
//
//  Created by 김민아 on 2016. 11. 2..
//  Copyright © 2016년 김민아. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NavigationControllerUITests : XCTestCase

@end

@implementation NavigationControllerUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testExample{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *tablesQuery = app.tables;
    [tablesQuery.staticTexts[@"TextAttributedString"] tap];
    [[[[app.navigationBars[@"TextAttributedString"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    [tablesQuery.staticTexts[@"WebView"] tap];
    [[[[app.navigationBars[@"WebView"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];

    
    
}

- (void)testLogin
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.tables.staticTexts[@"IntroUiView"] tap];
    [[[[[[[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:2] childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1] childrenMatchingType:XCUIElementTypeButton].element tap];
    [app.buttons[@"btnLogin"] tap];
    
    XCUIElement *logintextfieldTextField = app.textFields[@"loginTextField"];
    [logintextfieldTextField tap];
    [logintextfieldTextField typeText:@"yonghwinam@smtown.com"];
    [app.buttons[@"btnLogin1"] tap];
   

}

- (void)testDevice
{
    
}

@end
