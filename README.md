# 코드스쿼드 마스터즈 테스트
---
 * 1단계 : 단어 밀어내기 구현하기
 * 2단계 : 평면 큐브 구현하기
 * 3단계 : 루빅스 큐브 구현하기
---
## - 3단계 : 루빅스 큐브 구현하기 -


### Step-3.swift
#### - 게임시작
  ```swift 
    func startGame() {
        //초기셋팅
        var myRubiksCube = initializeCube() //움직인 큐브의 상태를 저장할 변수
        var isGameEnd = false               //ture면 게임 종료
        var orderCount = 0                  //입력받은 조작 갯수 출력 변수
        let startTime = Date()              //경과시간 계산을 위해 게임시작시 현재시각 가져옴
        printCube(myRubiksCube)             //초기큐브상태 출력

        while !isGameEnd {
            //사용자 입력
            let input = userInput()
     
            //큐브 조작
            for index in 0..<divideOrders(input).count {
                print(divideOrders(input)[index])
                myRubiksCube = pushNavigator(myRubiksCube, order: divideOrders(input)[index])
                printCube(myRubiksCube)
            }
            orderCount += divideOrders(input).count
            
            //종료
            isGameEnd = jugeEndGame(cube: myRubiksCube, order: input, orderCount: orderCount)
        }
        let endTime = Date()
        let useTime = Int(endTime.timeIntervalSince(startTime))
        print("경과 시간 : \(String(format: "%02d", useTime/60)):\(String(format: "%02d", useTime%60))")
    }
```
game 시작을 위해 startGame() 작성하였습니다.

흐름만 간단하게 설명하자면,

게임이 시작되면 필요한 변수들을 선언 및 초기화합니다.

한번 입력하고 끝나는게 아니라 게임이 지속되어야 하기 때문에 while문안에 isGameEnd가 true가 될 때까지

사용자입력, 큐브조작, 종료조건 확인을 계속 반복합니다. 그리고 종료가 되면 while문이 끝나면서 경과 시간을 00분:00초 단위로 보여줍니다.

---

흐름을 알았으니 각각의 메서드가 어떻게 동작하는지 위에서부터 알아가 봅시다. 🥰

#### - 초기큐브 상태 지정

```swift 
  var myRubiksCube = initializeCube()
  
     func initializeCube() -> [[[Character]]] {
        let rubiksCube: [[[Character]]] = [
            [["W", "W", "W"], ["W", "W", "W"], ["W", "W", "W"]],
            [["O", "O", "O"], ["O", "O", "O"], ["O", "O", "O"]],
            [["G", "G", "G"], ["G", "G", "G"], ["G", "G", "G"]],
            [["Y", "Y", "Y"], ["Y", "Y", "Y"], ["Y", "Y", "Y"]],
            [["B", "B", "B"], ["B", "B", "B"], ["B", "B", "B"]],
            [["R", "R", "R"], ["R", "R", "R"], ["R", "R", "R"]],
        ]
        return rubiksCube
    }
```

짜잔!! 저는 루빅스 큐브를 3차원 배열을 이용해서 구현해보았습니다!!! 😇 

일단 게임 시작시 초기 큐브의 상태를 초기화 해주겠습니다. 그리고 큐브의 상태를 출력해주는 PrintCube()를 이용해서 초기큐브의 상태를 보여줍니다.


```swift 
  printCube(myRubiksCube) 
  
      func printCube(_ cube: [[[Character]]]) {
        //위
        for row in 0...2 {
            print("\t\t\t\(cube[4][row][0]) \(cube[4][row][1]) \(cube[4][row][2])", terminator:"")
            print()
        }
        //측면
        for row in 0..<3 {
            for side in 0..<4 {
                print("\(cube[side][row][0]) \(cube[side][row][1]) \(cube[side][row][2])\t", terminator:"")
            }
            print()
        }
        //아래
        for row in 0...2 {
            print("\t\t\t\(cube[5][row][0]) \(cube[5][row][1]) \(cube[5][row][2])", terminator:"")
            print()
        }
    }
```

큐브는 6면이 펼쳐진 상태로 출력 됩니다. 

순서

* B면의 1열씩 3번 출력
* W,O,G,Y면의 1열씩 3번 출력
* R면의 1열씩 3번 출력


```swift 
//위  	  	       B B B
//쪽  	  	       B B B
//임  	  	       B B B

//측     W W W	  O O O	  G G G	  Y Y Y	
//면     W W W	  O O O	  G G G	  Y Y Y	
//임     W W W	  O O O	  G G G	  Y Y Y	

//아  	  	       R R R
//래  	  	       R R R
//임  	  	       R R R
```

---

#### -  사용자 입력

```swift 
  let input = userInput()
  
     func userInput() -> String {
        print("CODE> ", terminator:"")
        let input = readLine() ?? ""
        print()
        
        return input
    }
```


CODE> 프롬프트 만들어서 입력 받을 때마다 보여줌


#### - 큐브 조작

```swift 
      //큐브 조작
      for index in 0..<divideOrders(input).count {
         print(divideOrders(input)[index]) //조작 명령 출력
         myRubiksCube = pushNavigator(myRubiksCube, order: divideOrders(input)[index])  //큐브조작 후 변수에 저장
         printCube(myRubiksCube)           //조작 후 큐브상태 출력
      }
         orderCount += divideOrders(input).count  //조작 받은 갯수
```

divideOrders(input) -> input이 UU'R 이면 ["U","U\'","R"]로 만들어줍니다.

그러면 divideOrders(input).count = 3 이 되고 큐브조작을 U 한번, U' 한번, R 한번해서 3번 반복하게 됩니다.  

pushNavigator(조작할 큐브, 조작 명령) -> 조작명령에 따라 case에 해당하는 메서드를 실행합니다.

```swift
    func pushNavigator(_ cube: [[[Character]]], order: String) -> [[[Character]]] {
        var myCube = cube
        
        switch order {
        case "F":
            myCube = pushForF(cube)
        case "R":
            myCube = pushForR(cube)
        case "U":
            myCube = pushForU(cube)
        case "B":
            myCube = pushForB(cube)
        case "L":
            myCube = pushForL(cube)
        case "D":
            myCube = pushForD(cube)
        case "F'":
            myCube = pushForReverseF(cube)
        case "R'":
            myCube = pushForReverseR(cube)
        case "U'":
            myCube = pushForReverseU(cube)
        case "B'":
            myCube = pushForReverseB(cube)
        case "L'":
            myCube = pushForReverseL(cube)
        case "D'":
            myCube = pushForReverseD(cube)
        case "S":
            //뒤섞기
            let orders = ["F","R","U","L","B","D"]
            for _ in 0...20 {
                myCube = pushNavigator(myCube, order: orders.randomElement()!)
            }
        default:
            break
        }
        
        return myCube
    }
```
case문 안에 있는 메서드들은 큐브를 돌려가며 숫자를 하나하나 맞춰가며 했습니다. 뭔가 좋은 방법이 있을 것 같은..데? 흐음 🧐🧐🧐🧐

한개만 가져와 보자면 

```swift
    func pushForD(_ cube: [[[Character]]]) -> [[[Character]]] {
        var myCube = cube
        var tempValue = [Character]()
        var tempValue2 = [Character]()
 
        tempValue = myCube[2][2]
        tempValue2 = myCube[0][2]
        
        myCube[0][2] = myCube[3][2]
        myCube[2][2] = myCube[1][2]
        myCube[3][2] = tempValue
        myCube[1][2] = tempValue2
        
        return myCube
    }
```

---

#### - 게임 종료

드디어 게임이 끝난다.

게임이 끝나는건 2가지 경우다!

* Q를 입력한다.
* 큐브를 맞춘다. (조작된 큐브와 초기 큐브상태와 일치하면 게임 종료)

```swift
  //종료
  isGameEnd = jugeEndGame(cube: myRubiksCube, order: input, orderCount: orderCount)
  
      func jugeEndGame(cube: [[[Character]]], order: String, orderCount: Int) -> Bool {
        if order == "Q" {
            print("이용해주셔서 감사합니다. 🥰")
            print("조각 갯수 : \(orderCount-1)")
            
            return true
        }
        
        //추가 기능 : 모든 면을 맞출시 종료
        else if orderCount != 0 && cube == initializeCube() {
            print("축하합니다 맞추셨어요.~ 🥰")
            print("조각 갯수 : \(orderCount)")
            return true
        }
        
        return false
    }
```

매개변수로 온 데이터가 해당조건에 맞으면 true를 반환해서 startGame()의 while문 조건을 벗어나게 됩니다.

벗어나면 게임이 종료되면서 경과 시간을 보여줍니다.

---
#### - 추가 구현 기능

1. 프로그램 종료시 경과 시간

```swift
 let startTime = Date() 
 let endTime = Date()
 let useTime = Int(endTime.timeIntervalSince(startTime))
 print("경과 시간 : \(String(format: "%02d", useTime/60)):\(String(format: "%02d", useTime%60))")
```

2. 무작위 섞기 ("S" )

```swift
        case "S":
            //뒤섞기
            let orders = ["F","R","U","L","B","D"]
            for _ in 0...20 {
                myCube = pushNavigator(myCube, order: orders.randomElement()!)
            }
```

3. 큐브 다 맞추면 종료

```swift
    func jugeEndGame(cube: [[[Character]]], order: String, orderCount: Int) -> Bool {
        else if orderCount != 0 && cube == initializeCube() {
            print("축하합니다 맞추셨어요.~ 🥰")
            print("조각 갯수 : \(orderCount)")
            return true
        }
    }
```

조작된 큐브와 초기 큐브상태와 일치하면 게임 종료


