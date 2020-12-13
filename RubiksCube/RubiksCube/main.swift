//
//  main.swift
//  RubiksCube
//
//  Created by 오킹 on 2020/12/08.
//
/*
 order 종류
 F : O면 기준으로 오른쪽으로 돌림 F'는 왼쪽으로 돌림
 R : G면 기준으로 오른쪽으로 돌림 R'는 왼쪽으로 돌림
 U : B면 기준으로 오른쪽으로 돌림 U'는 왼쪽으로 돌림
 B : Y면 기준으로 오른쪽으로 돌림 B'는 왼쪽으로 돌림
 L : W면 기준으로 오른쪽으로 돌림 L'는 왼쪽으로 돌림
 D : R면 기준으로 오른쪽으로 돌림 D'는 왼쪽으로 돌림
 Q : 종료
 S : 뒤섞기
 */
import Foundation

func main() {
    let rubiksCubeManager = RubiksCubeManager()

    rubiksCubeManager.startGame()
}

func test() {
    let rubiksCubeTestManager = RubiksCubeTestManager()
    
    //Unit Test
      rubiksCubeTestManager.testStartGame()
//    rubiksCubeTestManager.testInitializeCube()
//    rubiksCubeTestManager.testPrintCube()
//    rubiksCubeTestManager.testPushNavigator()
//    rubiksCubeTestManager.testDivideOrders()
}

//test()
main()
