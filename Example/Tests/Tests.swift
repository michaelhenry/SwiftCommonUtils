// https://github.com/Quick/Quick

import Quick
import Nimble
import SwiftCommonUtils

class TestSwiftCommonUtils: QuickSpec {
    override func spec() {
        describe("for strings") {

            it("check email") {
                expect("me@iamkel.net".isValidEmail) == true
            
            }
 
        }
    }
}
