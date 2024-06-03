import 'package:flutter/material.dart';
import 'dart:math';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  supportedLocales: [
    const Locale('en', 'US'),
  ],
  home: MyApp(),
),);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // переменные
  Color color = Colors.black;

  // Draggable
  String CubeImg = "assets/lapka.png";
  int CubeNum = 0;

  // DragTarget(target)
  int CubeNumDragg = 0;
  String TargetCubeImg = "assets/lapka2.png";
  bool HasReceivedData = false;
  // DragTarget(target1)
  int CubeNumDragg_1 = 0;
  String TargetCubeImg_1 = "assets/lapka2.png";
  bool HasReceivedData_1 = false;
  // DragTarget(target2)
  int CubeNumDragg_2 = 0;
  String TargetCubeImg_2 = "assets/lapka2.png";
  bool HasReceivedData_2 = false;
  // DragTarget(target3)
  int CubeNumDragg_3 = 0;
  String TargetCubeImg_3 = "assets/lapka2.png";
  bool HasReceivedData_3 = false;
  // DragTarget(target4)
  int CubeNumDragg_4 = 0;
  String TargetCubeImg_4 = "assets/lapka2.png";
  bool HasReceivedData_4 = false;
  // DragTarget(target5)
  int CubeNumDragg_5 = 0;
  String TargetCubeImg_5 = "assets/lapka2.png";
  bool HasReceivedData_5 = false;
  // DragTarget(target6)
  int CubeNumDragg_6 = 0;
  String TargetCubeImg_6 = "assets/lapka2.png";
  bool HasReceivedData_6 = false;
  // DragTarget(target7)
  int CubeNumDragg_7 = 0;
  String TargetCubeImg_7 = "assets/lapka2.png";
  bool HasReceivedData_7 = false;
  // DragTarget(target8)
  int CubeNumDragg_8 = 0;
  String TargetCubeImg_8 = "assets/lapka2.png";
  bool HasReceivedData_8 = false;

  // Bot
  int BotCell = 0;
  String CubeImgBotFunc = "";
  int CubeNumBotFunc =0;
  //1
  String CubeImgBot = "assets/lapka1.png";
  int CubeNumBot = 0;
  //2
  String CubeImgBot_1 = "assets/lapka1.png";
  int CubeNumBot_1 = 0;
  //3
  String CubeImgBot_2 = "assets/lapka1.png";
  int CubeNumBot_2 = 0;
  //4
  String CubeImgBot_3 = "assets/lapka1.png";
  int CubeNumBot_3 = 0;
  //5
  String CubeImgBot_4 = "assets/lapka1.png";
  int CubeNumBot_4 = 0;
  //6
  String CubeImgBot_5 = "assets/lapka1.png";
  int CubeNumBot_5 = 0;
  //7
  String CubeImgBot_6 = "assets/lapka1.png";
  int CubeNumBot_6 = 0;
  //8
  String CubeImgBot_7 = "assets/lapka1.png";
  int CubeNumBot_7 = 0;
  //9
  String CubeImgBot_8 = "assets/lapka1.png";
  int CubeNumBot_8 = 0;

  int ScoreBotColumn_1 =0;
  int ScoreBotColumn_2 = 0;
  int ScoreBotColumn_3 = 0;

  int Counter = 0;
  int ScoreBot = 0;
  int ScorePlayer = 0;
  int ScorePlayerColumn_1 = 0;
  int ScorePlayerColumn_2 = 0;
  int ScorePlayerColumn_3 = 0;
  int previousCubeNum = -1;
  Random random = new Random();
  double Width = 89;
  double Height = 89;
  bool isDragging = true;
  String TextMove = "Ваш ход";
  bool _draggableVisible = false;
  bool _isButtonDisabled = false;

  // функция броска кубика
  void diceRoll() {
    setState(() {
      CubeNum = random.nextInt(6) + 1;
    CubeImg = 'assets/dice_$CubeNum.png';
    });
  }

  // функция подсчета очков игрока
  void scoreSum(){
    setState(() {
      //подсчет первой колонки
      if (CubeNumDragg == CubeNumDragg_1 && CubeNumDragg != CubeNumDragg_2) {
        // Умножение двух одинаковых и прибавление третьей
        ScorePlayerColumn_1 = (CubeNumDragg * CubeNumDragg_1) + CubeNumDragg_2;
      } else if (CubeNumDragg == CubeNumDragg_2 && CubeNumDragg != CubeNumDragg_1) {
        // Умножение двух одинаковых и прибавление третьей
        ScorePlayerColumn_1 = (CubeNumDragg * CubeNumDragg_2) + CubeNumDragg_1;
      } else if (CubeNumDragg_1 == CubeNumDragg_2 && CubeNumDragg != CubeNumDragg_1) {
        // Умножение двух одинаковых и прибавление третьей
        ScorePlayerColumn_1 = (CubeNumDragg_1 * CubeNumDragg_2) + CubeNumDragg;
      } else if (CubeNumDragg == CubeNumDragg_1 && CubeNumDragg == CubeNumDragg_2) {
        // Перемножение всех трех
        ScorePlayerColumn_1 = (CubeNumDragg * CubeNumDragg_1 * CubeNumDragg_2);
      } else{
        ScorePlayerColumn_1 = CubeNumDragg + CubeNumDragg_1 + CubeNumDragg_2;
      }
      //подсчет второй колонки
      if (CubeNumDragg_3 == CubeNumDragg_4 && CubeNumDragg_3 != CubeNumDragg_5) {
        // Умножение двух одинаковых и прибавление третьей
        ScorePlayerColumn_2 = (CubeNumDragg_3 * CubeNumDragg_4) + CubeNumDragg_5;
      } else if (CubeNumDragg_3 == CubeNumDragg_5 && CubeNumDragg_3 != CubeNumDragg_4) {
        // Умножение двух одинаковых и прибавление третьей
        ScorePlayerColumn_2 = (CubeNumDragg_3 * CubeNumDragg_5) + CubeNumDragg_4;
      } else if (CubeNumDragg_4 == CubeNumDragg_5 && CubeNumDragg_3 != CubeNumDragg_4) {
        // Умножение двух одинаковых и прибавление третьей
        ScorePlayerColumn_2 = (CubeNumDragg_4 * CubeNumDragg_5) + CubeNumDragg_3;
      } else if (CubeNumDragg_3 == CubeNumDragg_4 && CubeNumDragg_3 == CubeNumDragg_5) {
        // Перемножение всех трех
        ScorePlayerColumn_2 = (CubeNumDragg_3 * CubeNumDragg_4 * CubeNumDragg_5);
      } else{
        ScorePlayerColumn_2 = CubeNumDragg_3 + CubeNumDragg_4 + CubeNumDragg_5;
      }
      //подсчет третий колонки
      if (CubeNumDragg_6 == CubeNumDragg_7 && CubeNumDragg_6 != CubeNumDragg_8) {
        // Умножение двух одинаковых и прибавление третьей
        ScorePlayerColumn_3 = (CubeNumDragg_6 * CubeNumDragg_7) + CubeNumDragg_8;
      } else if (CubeNumDragg_6 == CubeNumDragg_8 && CubeNumDragg_6 != CubeNumDragg_7) {
        // Умножение двух одинаковых и прибавление третьей
        ScorePlayerColumn_3 = (CubeNumDragg_6 * CubeNumDragg_8) + CubeNumDragg_7;
      } else if (CubeNumDragg_7 == CubeNumDragg_8 && CubeNumDragg_6 != CubeNumDragg_7) {
        // Умножение двух одинаковых и прибавление третьей
        ScorePlayerColumn_3 = (CubeNumDragg_7 * CubeNumDragg_8) + CubeNumDragg_6;
      } else if (CubeNumDragg_6 == CubeNumDragg_7 && CubeNumDragg_6 == CubeNumDragg_8) {
        // Перемножение всех трех
        ScorePlayerColumn_3 = (CubeNumDragg_6 * CubeNumDragg_7 * CubeNumDragg_8);
      } else{
        ScorePlayerColumn_3 = CubeNumDragg_6 + CubeNumDragg_7 + CubeNumDragg_8;
      }
      ScorePlayer = ScorePlayerColumn_1 + ScorePlayerColumn_2 + ScorePlayerColumn_3;
    });
  }

  // Логика бота
  Random random_bot = new Random();
  List<int> numbers = List.filled(10, 0);
  void Bot(){
    setState(() {
      diceRoll();
      CubeImgBotFunc = CubeImg;
      CubeNumBotFunc = CubeNum;
      // выбор клетки куда бот поставит кубик
      BotCell = random_bot.nextInt(9) + 1;
      while (BotCell == numbers[BotCell] && numbers[BotCell] != 0){
        BotCell = random_bot.nextInt(9) + 1;
      }
        if (BotCell == 1) {
          CubeImgBot = CubeImgBotFunc;
          CubeNumBot = CubeNumBotFunc;
          numbers[1] = BotCell;
        } else if (BotCell == 2) {
          CubeImgBot_1 = CubeImgBotFunc;
          CubeNumBot_1 = CubeNumBotFunc;
          numbers[2] = BotCell;
        } else if (BotCell == 3) {
          CubeImgBot_2 = CubeImgBotFunc;
          CubeNumBot_2 = CubeNumBotFunc;
          numbers[3] = BotCell;
        } else if (BotCell == 4) {
          CubeImgBot_3 = CubeImgBotFunc;
          CubeNumBot_3 = CubeNumBotFunc;
          numbers[4] = BotCell;
        } else if (BotCell == 5) {
          CubeImgBot_4 = CubeImgBotFunc;
          CubeNumBot_4 = CubeNumBotFunc;
          numbers[5] = BotCell;
        } else if (BotCell == 6) {
          CubeImgBot_5 = CubeImgBotFunc;
          CubeNumBot_5 = CubeNumBotFunc;
          numbers[6] = BotCell;
        } else if (BotCell == 7) {
          CubeImgBot_6 = CubeImgBotFunc;
          CubeNumBot_6 = CubeNumBotFunc;
          numbers[7] = BotCell;
        } else if (BotCell == 8) {
          CubeImgBot_7 = CubeImgBotFunc;
          CubeNumBot_7 = CubeNumBotFunc;
          numbers[8] = BotCell;
        } else if (BotCell == 9) {
          CubeImgBot_8 = CubeImgBotFunc;
          CubeNumBot_8 = CubeNumBotFunc;
          numbers[9] = BotCell;
        }
      // подсчет очков бота
      if (CubeNumBot == CubeNumBot_1 && CubeNumBot != CubeNumBot_2) {
        // Умножение двух одинаковых и прибавление третьей
        ScoreBotColumn_1 = (CubeNumBot * CubeNumBot_1) + CubeNumBot_2;
      } else if (CubeNumBot == CubeNumBot_2 && CubeNumBot != CubeNumBot_1) {
        // Умножение двух одинаковых и прибавление третьей
        ScoreBotColumn_1  = (CubeNumBot * CubeNumBot_2) + CubeNumBot_1;
      } else if (CubeNumBot_1 == CubeNumBot_2 && CubeNumBot != CubeNumBot_1) {
        // Умножение двух одинаковых и прибавление третьей
        ScoreBotColumn_1  = (CubeNumBot_1 * CubeNumBot_2) + CubeNumBot;
      } else if (CubeNumBot == CubeNumBot_1 && CubeNumBot == CubeNumBot_2) {
        // Перемножение всех трех
        ScoreBotColumn_1  = (CubeNumBot * CubeNumBot_1 * CubeNumBot_2);
      } else{
        ScoreBotColumn_1  = CubeNumBot + CubeNumBot_1 + CubeNumBot_2;
      }
      //подсчет второй колонки
      if (CubeNumBot_3 == CubeNumBot_4 && CubeNumBot_3 != CubeNumBot_5) {
        // Умножение двух одинаковых и прибавление третьей
        ScoreBotColumn_2 = (CubeNumBot_3 * CubeNumBot_4) + CubeNumBot_5;
      } else if (CubeNumBot_3 == CubeNumBot_5 && CubeNumBot_3 != CubeNumBot_4) {
        // Умножение двух одинаковых и прибавление третьей
        ScoreBotColumn_2 = (CubeNumBot_3 * CubeNumBot_5) + CubeNumBot_4;
      } else if (CubeNumBot_4 == CubeNumBot_5 && CubeNumBot_3 != CubeNumBot_4) {
        // Умножение двух одинаковых и прибавление третьей
        ScoreBotColumn_2 = (CubeNumBot_4 * CubeNumBot_5) + CubeNumBot_3;
      } else if (CubeNumBot_3 == CubeNumBot_4 && CubeNumBot_3 == CubeNumBot_5) {
        // Перемножение всех трех
        ScoreBotColumn_2 = (CubeNumBot_3 * CubeNumBot_4 * CubeNumBot_5);
      } else{
        ScoreBotColumn_2 = CubeNumBot_3 + CubeNumBot_4 + CubeNumBot_5;
      }
      //подсчет третий колонки
      if (CubeNumBot_6 == CubeNumBot_7 && CubeNumBot_6 != CubeNumBot_8) {
        // Умножение двух одинаковых и прибавление третьей
        ScoreBotColumn_3 = (CubeNumBot_6 * CubeNumBot_7) + CubeNumBot_8;
      } else if (CubeNumBot_6 == CubeNumBot_8 && CubeNumBot_6 != CubeNumBot_7) {
        // Умножение двух одинаковых и прибавление третьей
        ScoreBotColumn_3 = (CubeNumBot_6 * CubeNumBot_8) + CubeNumBot_7;
      } else if (CubeNumBot_7 == CubeNumBot_8 && CubeNumBot_6 != CubeNumBot_7) {
        // Умножение двух одинаковых и прибавление третьей
        ScoreBotColumn_3 = (CubeNumBot_7 * CubeNumBot_8) + CubeNumBot_6;
      } else if (CubeNumBot_6 == CubeNumBot_7 && CubeNumBot_6 == CubeNumBot_8) {
        // Перемножение всех трех
        ScoreBotColumn_3 = (CubeNumBot_6 * CubeNumBot_7 * CubeNumBot_8);
      } else{
        ScoreBotColumn_3 = CubeNumBot_6 + CubeNumBot_7 + CubeNumBot_8;
      }
      ScoreBot = ScoreBotColumn_1 + ScoreBotColumn_2 + ScoreBotColumn_3;
      _isButtonDisabled = false;
      TextMove = 'Ваш ход';
      AlertEndGame();
    });
  }

  // функция кнопки
  void HandleButtonPress() {
    if (!_isButtonDisabled) {
      _draggableVisible = true;
      diceRoll();
      setState(() {
        _isButtonDisabled = true; // Блокируем кнопку
      });
    }
  }

  // функция вывода сообщения об окончании игры
  void AlertEndGame(){
    if(CubeNumDragg > 0 && CubeNumDragg_1 > 0 && CubeNumDragg_2 > 0 && CubeNumDragg_3 > 0 && CubeNumDragg_4 > 0 && CubeNumDragg_5 > 0 && CubeNumDragg_6 > 0 && CubeNumDragg_7 > 0 && CubeNumDragg_8 > 0 || CubeNumBot > 0 && CubeNumBot_1 > 0 && CubeNumBot_2 > 0 && CubeNumBot_3 > 0 && CubeNumBot_4 > 0 && CubeNumBot_5 > 0 && CubeNumBot_6 > 0 && CubeNumBot_7 > 0 && CubeNumBot_8 > 0){
      if(ScorePlayer > ScoreBot){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Игра окончена"),
            content: Text("Вы выйграли со счётом: $ScorePlayer, \nСчет бота: $ScoreBot"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  RestartGame();
                  },
                child: Center(
                    child:Text("Начать заново")
                ),
              ),
            ],
          ),
        );
      }else if(ScoreBot > ScorePlayer){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Игра окончена"),
            content: Text("Бот выйграл со счетом: $ScoreBot, \nВаш счет: $ScorePlayer"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  RestartGame();
                },
                child: Center(
                    child:Text("Начать заново")
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  // функция перезапуска игры
  void RestartGame(){
    setState(() {
    CubeImg = "assets/grey.png";
    CubeNum = 0;

    // DragTarget(target)
    CubeNumDragg = 0;
    TargetCubeImg = "assets/lapka2.png";
    HasReceivedData = false;
    // DragTarget(target1)
    CubeNumDragg_1 = 0;
    TargetCubeImg_1 = "assets/lapka2.png";
    HasReceivedData_1 = false;
    // DragTarget(target2)
    CubeNumDragg_2 = 0;
    TargetCubeImg_2 = "assets/lapka2.png";
    HasReceivedData_2 = false;
    // DragTarget(target3)
    CubeNumDragg_3 = 0;
    TargetCubeImg_3 = "assets/lapka2.png";
    HasReceivedData_3 = false;
    // DragTarget(target4)
    CubeNumDragg_4 = 0;
    TargetCubeImg_4 = "assets/lapka2.png";
    HasReceivedData_4 = false;
    // DragTarget(target5)
    CubeNumDragg_5 = 0;
    TargetCubeImg_5 = "assets/lapka2.png";
    HasReceivedData_5 = false;
    // DragTarget(target6)
    CubeNumDragg_6 = 0;
    TargetCubeImg_6 = "assets/lapka2.png";
    HasReceivedData_6 = false;
    // DragTarget(target7)
    CubeNumDragg_7 = 0;
    TargetCubeImg_7 = "assets/lapka2.png";
    HasReceivedData_7 = false;
    // DragTarget(target8)
    CubeNumDragg_8 = 0;
    TargetCubeImg_8 = "assets/lapka2.png";
    HasReceivedData_8 = false;

    // Bot
    BotCell = 0;
    CubeImgBotFunc = "";
    CubeNumBotFunc =0;
    //1
    CubeImgBot = "assets/lapka1.png";
    CubeNumBot = 0;
    //2
    CubeImgBot_1 = "assets/lapka1.png";
    CubeNumBot_1 = 0;
    //3
    CubeImgBot_2 = "assets/lapka1.png";
    CubeNumBot_2 = 0;
    //4
    CubeImgBot_3 = "assets/lapka1.png";
    CubeNumBot_3 = 0;
    //5
    CubeImgBot_4 = "assets/lapka1.png";
    CubeNumBot_4 = 0;
    //6
    CubeImgBot_5 = "assets/lapka1.png";
    CubeNumBot_5 = 0;
    //7
    CubeImgBot_6 = "assets/lapka1.png";
    CubeNumBot_6 = 0;
    //8
    CubeImgBot_7 = "assets/lapka1.png";
    CubeNumBot_7 = 0;
    //9
    CubeImgBot_8 = "assets/lapka1.png";
    CubeNumBot_8 = 0;

    ScoreBotColumn_1 =0;
    ScoreBotColumn_2 = 0;
    ScoreBotColumn_3 = 0;

    Counter = 0;
    ScoreBot = 0;
    ScorePlayer = 0;
    ScorePlayerColumn_1 = 0;
    ScorePlayerColumn_2 = 0;
    ScorePlayerColumn_3 = 0;
    previousCubeNum = -1;
    _draggableVisible = false;
    numbers = List.filled(10, 0);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 240, 245, 1),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // row для отображения счета и  аватарки противника
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // аватарка бота
                  ClipRRect(
                    // округление краев аватарки
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset("assets/ava.jpg", height: 65, width: 65, ),
                  ),
                  // вывод счета бота
                  Text('$ScoreBot', style: TextStyle(fontSize: 20),),
                ],
              ),
              // row для вывода поля бота
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: Width,
                        height: Height,
                        padding: EdgeInsets.only(top: 2, bottom: 2),
                        child: Center(
                          child:Image.asset("$CubeImgBot", width: 94, height: 94),
                        ),
                      ),
                      Container(
                        width: Width,
                        height: Height,
                        padding: EdgeInsets.only(top: 2, bottom: 2),
                        child: Center(
                          child:Image.asset("$CubeImgBot_1", width: 94, height: 94,),
                        ),
                      ),
                      Container(
                        width: Width,
                        height: Height,
                        padding: EdgeInsets.only(top: 2, bottom: 2),
                        child: Center(
                          child:Image.asset("$CubeImgBot_2", width: 94, height: 94,),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: Width,
                        height: Height,
                        padding: EdgeInsets.only(top: 2, bottom: 2),
                        child: Center(
                          child:Image.asset("$CubeImgBot_3", width: 94, height: 94,),
                        ),
                      ),
                      Container(
                        width: Width,
                        height: Height,
                        padding: EdgeInsets.only(top: 2, bottom: 2),
                        child: Center(
                          child:Image.asset("$CubeImgBot_4", width: 94, height: 94,),
                        ),
                      ),
                      Container(
                        width: Width,
                        height: Height,
                        padding: EdgeInsets.only(top: 2, bottom: 2),
                        child: Center(
                          child:Image.asset("$CubeImgBot_5", width: 94, height: 94,),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: Width,
                        height: Height,
                        padding: EdgeInsets.only(top: 2, bottom: 2),
                        child: Center(
                          child:Image.asset("$CubeImgBot_6", width: 94, height: 94,),
                        ),
                      ),
                      Container(
                        width: Width,
                        height: Height,
                        padding: EdgeInsets.only(top: 2, bottom: 2),
                        child: Center(
                          child:Image.asset("$CubeImgBot_7", width: 94, height: 94,),
                        ),
                      ),
                      Container(
                        width: Width,
                        height: Height,
                        padding: EdgeInsets.only(top: 2, bottom: 2),
                        child: Center(
                          child:Image.asset("$CubeImgBot_8", width: 94, height: 94,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // row для кубика и кнопки
              Row(
                // положение прижаты к правой части экрана
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(right:55),
                    child: Text('$TextMove'),
                  ),
                  // кубик
                  // параметры перетаскиваемого элемента
                  Container(
                    width: 94,
                  height: 94,
                    child:Draggable<String>(
                      data: '$CubeImg $CubeNum', // Передаем строку с изображением и числом
                      child:Visibility(
                        visible: _draggableVisible,
                        child: Container(
                          padding: EdgeInsets.only(top: 5, bottom:5),
                          width: 94,
                          height: 94,
                          child: Center(
                            child: Image.asset("$CubeImg"),
                      ),
                    ),
                    ),
                    feedback: Container(
                      width: 90,
                      height: 90,
                      child: Center(
                        child: Image.asset("$CubeImg"),
                      ),
                    ),
                    childWhenDragging: Container(
                      width: 94,
                      height: 94,
                    ),
                    onDragEnd: (details) {
                      _draggableVisible = false;
                      TextMove = 'Ход \n противника';
                      Counter++;
                      AlertEndGame();
                      Bot();
                    },
                  ),
                  ),
                  // кнопка для броска кубика
                  Container(
                    padding: EdgeInsets.only(left:12),
                    child:ElevatedButton(
                      // событие происходящие при нажатии на кнопку
                      onPressed: _isButtonDisabled ? null : HandleButtonPress,
                      // текс кнопки
                      child: Text('Кинуть кубик'),
                    ),
                  ),
                ],
              ),
              // row для вывода поля игрока
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      DragTarget<String>(
                        key: Key('target'),
                        onAccept: (value) {
                          if (HasReceivedData) {
                            return;
                          }
                          HasReceivedData = true;
                          final parts = value.split(' '); // Разделяем строку на изображение и число
                          TargetCubeImg = parts[0];
                          CubeNumDragg = int.tryParse(parts[1]) ?? CubeNumDragg;
                          scoreSum();
                        },
                        builder: (context, _, __) => Container(
                          width: Width,
                          height: Height,
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          child: Center(
                            child: Image.asset("$TargetCubeImg"),
                          ),
                        ),
                      ),
                      DragTarget<String>(
                        key: Key('target1'),
                        onAccept: (value) {
                          if (HasReceivedData_1) {
                            return;
                          }
                          HasReceivedData_1 = true;
                          final parts = value.split(' '); // Разделяем строку на изображение и число
                          TargetCubeImg_1 = parts[0];
                          CubeNumDragg_1 = int.tryParse(parts[1]) ?? CubeNumDragg;
                          scoreSum();
                        },
                        builder: (context, _, __) => Container(
                          width: Width,
                          height: Height,
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          child: Center(
                            child: Image.asset("$TargetCubeImg_1"),
                          ),
                        ),
                      ),
                      DragTarget<String>(
                        key: Key('target2'),
                        onAccept: (value) {
                          if (HasReceivedData_2) {
                            return;
                          }
                          HasReceivedData_2 = true;
                          final parts = value.split(' '); // Разделяем строку на изображение и число
                          TargetCubeImg_2 = parts[0];
                          CubeNumDragg_2 = int.tryParse(parts[1]) ?? CubeNumDragg;
                          scoreSum();
                        },
                        builder: (context, _, __) => Container(
                          width: Width,
                          height: Height,
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          child: Center(
                            child: Image.asset("$TargetCubeImg_2"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      DragTarget<String>(
                        key: Key('target3'),
                        onAccept: (value) {
                          if (HasReceivedData_3) {
                            return;
                          }
                          HasReceivedData_3 = true;
                          final parts = value.split(' '); // Разделяем строку на изображение и число
                          TargetCubeImg_3 = parts[0];
                          CubeNumDragg_3 = int.tryParse(parts[1]) ?? CubeNumDragg;
                          scoreSum();
                        },
                        builder: (context, _, __) => Container(
                          width: Width,
                          height: Height,
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          child: Center(
                            child: Image.asset("$TargetCubeImg_3"),
                          ),
                        ),
                      ),
                      DragTarget<String>(
                        key: Key('target4'),
                        onAccept: (value) {
                          if (HasReceivedData_4) {
                            return;
                          }
                          HasReceivedData_4 = true;
                          final parts = value.split(' '); // Разделяем строку на изображение и число
                          TargetCubeImg_4 = parts[0];
                          CubeNumDragg_4 = int.tryParse(parts[1]) ?? CubeNumDragg;
                          scoreSum();
                        },
                        builder: (context, _, __) => Container(
                          width: Width,
                          height: Height,
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          child: Center(
                            child: Image.asset("$TargetCubeImg_4"),
                          ),
                        ),
                      ),
                      DragTarget<String>(
                        key: Key('target5'),
                        onAccept: (value) {
                          if (HasReceivedData_5) {
                            return;
                          }
                          HasReceivedData_5 = true;
                          final parts = value.split(' '); // Разделяем строку на изображение и число
                          TargetCubeImg_5 = parts[0];
                          CubeNumDragg_5 = int.tryParse(parts[1]) ?? CubeNumDragg;
                          scoreSum();
                        },
                        builder: (context, _, __) => Container(
                          width: Width,
                          height: Height,
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          child: Center(
                            child: Image.asset("$TargetCubeImg_5"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      DragTarget<String>(
                        key: Key('target6'),
                        onAccept: (value) {
                          if (HasReceivedData_6) {
                            return;
                          }
                          HasReceivedData_6 = true;
                          final parts = value.split(' '); // Разделяем строку на изображение и число
                          TargetCubeImg_6 = parts[0];
                          CubeNumDragg_6 = int.tryParse(parts[1]) ?? CubeNumDragg;
                          scoreSum();
                        },
                        builder: (context, _, __) => Container(
                          width: Width,
                          height: Height,
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          child: Center(
                            child: Image.asset("$TargetCubeImg_6"),
                          ),
                        ),
                      ),
                      DragTarget<String>(
                        key: Key('target7'),
                        onAccept: (value) {
                          if (HasReceivedData_7) {
                            return;
                          }
                          HasReceivedData_7 = true;
                          final parts = value.split(' '); // Разделяем строку на изображение и число
                          TargetCubeImg_7 = parts[0];
                          CubeNumDragg_7 = int.tryParse(parts[1]) ?? CubeNumDragg;
                          scoreSum();
                        },
                        builder: (context, _, __) => Container(
                          width: Width,
                          height: Height,
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          child: Center(
                            child: Image.asset("$TargetCubeImg_7"),
                          ),
                        ),
                      ),
                      DragTarget<String>(
                        key: Key('target8'),
                        onAccept: (value) {
                          if (HasReceivedData_8) {
                            return;
                          }
                          HasReceivedData_8 = true;
                          final parts = value.split(' '); // Разделяем строку на изображение и число
                          TargetCubeImg_8 = parts[0];
                          CubeNumDragg_8 = int.tryParse(parts[1]) ?? CubeNumDragg;
                          scoreSum();
                        },
                        builder: (context, _, __) => Container(
                          width: Width,
                          height: Height,
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          child: Center(
                            child: Image.asset("$TargetCubeImg_8"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // row для вывода счета и аватарки игрока
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // вывод очков игрока
                  Text("$ScorePlayer", style: TextStyle(fontSize: 20),),
                  // вывод аватарки игрока
                  ClipRRect(
                    // округление краев аватарки
                    borderRadius: BorderRadius.circular(40),
                    child:  Image.asset("assets/ava_1.png", height: 65, width: 65, ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}