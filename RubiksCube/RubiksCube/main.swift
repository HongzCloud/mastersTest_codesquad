//
//  main.swift
//  RubiksCube
//
//  Created by 오킹 on 2020/12/08.
//

import Foundation

//MARK:- Step1 Test Code
func testStep1() {
    print(pushWord("apple 3 L") == "leapp" ? "PASS":"FAILED")
    print(pushWord("banana 6 R") == "banana" ? "PASS":"FAILED")
    print(pushWord("carrot -1 r") == "arrotc" ? "PASS":"FAILED")
    print(pushWord("cat -4 R") == "atc" ? "PASS":"FAILED")
}
testStep1()

//User input Test Code
//let input = readLine() ?? ""
//pushWord(input)
