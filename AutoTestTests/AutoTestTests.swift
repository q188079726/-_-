//
//  AutoTestTests.swift
//  AutoTestTests
//
//  Created by 李硕 on 16/1/7.
//  Copyright © 2016年 李硕. All rights reserved.
//

import XCTest
@testable import AutoTest

class AutoTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    let translator = Translator()
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        //第零组测试
        //包含其他字符
        let inputString0 = "第一百三十五"
        let outputInt0 = 135
        
        let result0 = translator.translate(inputString0)
        assert(result0 == outputInt0)
        
        //第一组测试
        //顺序的数字
        let inputString1 = "二万五千七百六十八"
        let outputInt1 = 25768
        
        
        let result1 = translator.translate(inputString1)
        assert(result1 == outputInt1)
        
        //第二组测试
        //包含零的越位
        let inputString2 = "七千零四"
        let outputInt2 = 7004
        
        let result2 = translator.translate(inputString2)
        assert(result2 == outputInt2)
        
        //第三组测试
        //十位省略1
        let inputString3 = "十"
        let outputInt3 = 10
        
        let result3 = translator.translate(inputString3)
        assert(result3 == outputInt3)
        
        let inputString32 = "十八"
        let outputInt32 = 18
        
        let result32 = translator.translate(inputString32)
        assert(result32 == outputInt32)
        
        //第四组测试
        //整数结尾
        let inputString4 = "三千六百"
        let outputInt4 = 3600
        
        let result4 = translator.translate(inputString4)
        assert(result4 == outputInt4)

        let inputString42 = "二十六万"
        let outputInt42 = 260000
        
        let result42 = translator.translate(inputString42)
        assert(result42 == outputInt42)

        
        //第五组测试
        //复合功能点
//        0.含特殊字的顺序数字
//        "第九亿八千七百六十五万四千三百二十一"
//        1.含零越位,和十位省略
//        "五万零七十三"
//        2.含零越位和整数结尾
//        "二十万零八千"
//        3.十位省略和整数结尾
//        "十万三千七百"
//        4.含零越位,整数结尾,十位省略
//        "十亿零三百"
        let s0 = "第九亿八千七百六十五万四千三百二十一"
        let i0 = 9_8765_4321
        assert(testMethod(s0, resultNumber: i0))
        
        let s1 = "五万零七十三"
        let i1 = 5_0073
        assert(testMethod(s1, resultNumber: i1))
        
        let s2 = "二十万零八千"
        let i2 = 20_8000
        assert(testMethod(s2, resultNumber: i2))

        let s3 = "十万三千七百"
        let i3 = 10_3700
        assert(testMethod(s3, resultNumber: i3))

        let s4 = "十亿零三百"
        let i4 = 10_0000_0300
        assert(testMethod(s4, resultNumber: i4))

//        第六组测试
//        1.两和二
//        "两千三百万"
//        特殊情况
//        2.溢出
//        "九千八百七十六亿五千四百三十二万一千零九十八"

        let s61 = "两千三百万"
        let i61 = 2300_0000
        assert(testMethod(s61, resultNumber: i61))
        
        let s62 = "九千八百七十六亿五千四百三十二万一千零九十八"
        let i62 = 9876_5432_1098
        assert(testMethod(s62, resultNumber: i62))
        
        
    }
    
    func testMethod(inputString :String, resultNumber: Int) -> Bool {
        let result = translator.translate(inputString)
        return result == resultNumber
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
