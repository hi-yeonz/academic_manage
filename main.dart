import 'package:flutter/material.dart';
import 'package:main_flutter_app/DrawerPage.dart';
import 'SampleQuestion.dart';
import 'ChatPage.dart';
import 'PersonalPage.dart';
import 'Workbook.dart';
import 'InputScore.dart';
import 'DrawerPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      initialRoute: '/',
      routes: { //네이게이션 위치 지정
        '/SampleQuestion': (BuildContext context)=>SampleQuestion(),
        '/InputScore': (BuildContext context)=>InputScore(),
        '/events': (BuildContext context)=>EventsPage(),
        '/notes': (BuildContext context)=>NotesPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  var _pages = [
    QuestionsPage(), //=Workbook page
    PersonalPage(),
    ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(  //기본 틀 구성

      //앱 바
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(
              '성진학원',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            )
          ],
        ),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.grey[800],
              ),
              onPressed: () {
                print('Setting');
              }),
        ],
      ),

      //drawer 옆에서 나오는 메뉴판판
      drawer: AppDrawer(),

      //var _pages[] 안에 index 순서대로 class 나열]
      body: _pages[_index],

      //화면 아래 탭 버튼
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index, //현재 index
        // 하단 탭을 눌렀을 때 화면 표시(back ground color/ (un)selected Item color /(un)selected font size)

        onTap: (index){     //탭을 눌렀을 때
          setState(() {      //index 를 누를 때 마다 새로 State 빌드.
            _index = index;  //_index 에 선택한 index 부여
          });
        },
        //index 는 처음 아이템부터 0,1,2
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: '문제', icon: Icon(Icons.add)),
          BottomNavigationBarItem(label: 'My Page', icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: '채팅', icon: Icon(Icons.question_answer)),
        ],
      ),
    );
  }
}












//coding_by_hj