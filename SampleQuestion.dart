import 'package:flutter/material.dart';

class SampleQuestion extends StatefulWidget {
  @override
  _SampleQuestionState createState() => _SampleQuestionState();
}

class _SampleQuestionState extends State<SampleQuestion> {
  final _questions = const [
    {
      'questionText': 'Q1. 철수는 영희와 밥을 먹었다.',
      'answers': [
        {'text': '철수는 영희를 좋아한다.', 'score': 10},
        {'text': '철수는 밥을 좋아한다.', 'score': 5},
        {'text': '철수는 시간이 많다.', 'score': 2},
        {'text': '철수는 많이 먹는다.', 'score': 1},
      ],
    },
    { 'questionText': 'Q2. 민수는 들판을 달렸다.',
      'answers': [
        {'text': '민수.', 'score': 10},
        {'text': '들판', 'score': 5},
        {'text': '달리다', 'score': 2},
        {'text': '푸른 하늘', 'score': 0},
      ],
    },

    { 'questionText': 'Q3. 희영이는 눈사람을 만들었다.',
      'answers': [
        {'text': '희영이', 'score': 10},
        {'text': '겨울', 'score': 5},
        {'text': '눈사람', 'score': 2},
        {'text': '추워', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex +1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length){
      print('We have more questions!');}
    else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('문제집이름'),
        ),
        body: ListView(
          children: <Widget>[
            LinearProgressIndicator(
              value: 0.5,
            ),
            Padding(padding: const EdgeInsets.all(30),
              child: _questionIndex < _questions.length
                  ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,)
                  :Result(_totalScore, _resetQuiz),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('뒤로가기'),
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,);
  }
}


//Quiz

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ), //Question
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    ); //Column
  }
}


//Question

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity ,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.start,
      ),
    );
  }
}


//Answer

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(answerText),
        onPressed: selectHandler,
      ), //RaisedButton
    ); //Container
  }
}


class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  //Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 21) {
      resultText = 'You are awesome!';
      print(resultScore);
    } else if (resultScore >= 16) {
      resultText = 'Pretty likeable!';
      print(resultScore);
    } else if (resultScore >= 10) {
      resultText = 'You need to work more!';
    } else if (resultScore >= 3) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '$resultScore',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          ElevatedButton(
            child: Text(
              'Restart Quiz!',
            ), //Text
            onPressed: resetHandler,
          ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}