import XCTest

import swift_codecovTests

var tests = [XCTestCaseEntry]()
tests += swift_codecovTests.allTests()
XCTMain(tests)
