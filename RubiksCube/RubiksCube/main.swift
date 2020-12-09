//
//  main.swift
//  RubiksCube
//
//  Created by 오킹 on 2020/12/08.
//

import Foundation

//MARK:- Step-2 Test Code
func testStep2() {
   let flatCubeManager = FlatCubeManager()
    //Integration Test
    //flatCubeManager.startGame()
    
    //Unit Test
    flatCubeManager.showResult([["R","R","W"], ["G","C","W"], ["G","B","B"]])
}

testStep2()
