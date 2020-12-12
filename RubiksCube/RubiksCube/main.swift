//
//  main.swift
//  RubiksCube
//
//  Created by 오킹 on 2020/12/08.
//

import Foundation

func main() {
    let rubiksCubeManager = RubiksCubeManager()

}

func test() {
    let rubiksCubeTestManager = RubiksCubeTestManager()
    
    //Unit Test
    rubiksCubeTestManager.testStartGame()
    rubiksCubeTestManager.testInitializeCube()
    rubiksCubeTestManager.testPrintCube()
    rubiksCubeTestManager.testPushNavigator()
}

test()
