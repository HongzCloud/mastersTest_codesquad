//
//  TestStep-3.swift
//  RubiksCube
//
//  Created by 오킹 on 2020/12/12.
//

import Foundation

struct RubiksCubeTestManager {
    let rubiksCubeManager = RubiksCubeManager()
    
    func testStartGame() {
        rubiksCubeManager.startGame()
    }
    
    func testInitializeCube() {
        print(rubiksCubeManager.initializeCube() == [[["W", "W", "W"], ["W", "W", "W"], ["W", "W", "W"]], [["O", "O", "O"], ["O", "O", "O"], ["O", "O", "O"]], [["G", "G", "G"], ["G", "G", "G"], ["G", "G", "G"]], [["Y", "Y", "Y"], ["Y", "Y", "Y"], ["Y", "Y", "Y"]], [["B", "B", "B"], ["B", "B", "B"], ["B", "B", "B"]], [["R", "R", "R"], ["R", "R", "R"], ["R", "R", "R"]]] ? "PASS":"FAILED")
    }
    
    func testPrintCube() {
        rubiksCubeManager.printCube([[["W", "W", "W"], ["W", "W", "W"], ["W", "W", "W"]], [["O", "O", "O"], ["O", "O", "O"], ["O", "O", "O"]], [["G", "G", "G"], ["G", "G", "G"], ["G", "G", "G"]], [["Y", "Y", "Y"], ["Y", "Y", "Y"], ["Y", "Y", "Y"]], [["B", "B", "B"], ["B", "B", "B"], ["B", "B", "B"]], [["R", "R", "R"], ["R", "R", "R"], ["R", "R", "R"]]])
    }
    
    func testPushNavigator() {
//      rubiksCubeManager.pushNavigator([[["W", "W", "W"], ["W", "W", "W"], ["W", "W", "W"]], [["O", "O", "O"], ["O", "O", "O"], ["O", "O", "O"]], [["G", "G", "G"], ["G", "G", "G"], ["G", "G", "G"]], [["Y", "Y", "Y"], ["Y", "Y", "Y"], ["Y", "Y", "Y"]], [["B", "B", "B"], ["B", "B", "B"], ["B", "B", "B"]], [["R", "R", "R"], ["R", "R", "R"], ["R", "R", "R"]]], order: "F")
//      rubiksCubeManager.pushNavigator([[["W", "W", "W"], ["W", "W", "W"], ["W", "W", "W"]], [["O", "O", "O"], ["O", "O", "O"], ["O", "O", "O"]], [["G", "G", "G"], ["G", "G", "G"], ["G", "G", "G"]], [["Y", "Y", "Y"], ["Y", "Y", "Y"], ["Y", "Y", "Y"]], [["B", "B", "B"], ["B", "B", "B"], ["B", "B", "B"]], [["R", "R", "R"], ["R", "R", "R"], ["R", "R", "R"]]], order: "R")
//        }
//      rubiksCubeManager.pushNavigator([[["W", "W", "W"], ["W", "W", "W"], ["W", "W", "W"]], [["O", "O", "O"], ["O", "O", "O"], ["O", "O", "O"]], [["G", "G", "G"], ["G", "G", "G"], ["G", "G", "G"]], [["Y", "Y", "Y"], ["Y", "Y", "Y"], ["Y", "Y", "Y"]], [["B", "B", "B"], ["B", "B", "B"], ["B", "B", "B"]], [["R", "R", "R"], ["R", "R", "R"], ["R", "R", "R"]]], order: "U")
//        }
//      rubiksCubeManager.pushNavigator([[["W", "W", "W"], ["W", "W", "W"], ["W", "W", "W"]], [["O", "O", "O"], ["O", "O", "O"], ["O", "O", "O"]], [["G", "G", "G"], ["G", "G", "G"], ["G", "G", "G"]], [["Y", "Y", "Y"], ["Y", "Y", "Y"], ["Y", "Y", "Y"]], [["B", "B", "B"], ["B", "B", "B"], ["B", "B", "B"]], [["R", "R", "R"], ["R", "R", "R"], ["R", "R", "R"]]], order: "B")
//    }
        rubiksCubeManager.pushNavigator([[["W", "W", "W"], ["W", "W", "W"], ["W", "W", "W"]], [["O", "O", "O"], ["O", "O", "O"], ["O", "O", "O"]], [["G", "G", "G"], ["G", "G", "G"], ["G", "G", "G"]], [["Y", "Y", "Y"], ["Y", "Y", "Y"], ["Y", "Y", "Y"]], [["B", "B", "B"], ["B", "B", "B"], ["B", "B", "B"]], [["R", "R", "R"], ["R", "R", "R"], ["R", "R", "R"]]], order: "L")
    }
}
