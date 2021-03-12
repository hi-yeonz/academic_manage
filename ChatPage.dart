import 'package:flutter/material.dart';



class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}


//메세지 보내거나 상태가 변할때마다 리빌드
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  //입력된 내용을 읽고 보내는 class. TextField 의 인수가 될 변수
 TextEditingController _textEditingController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemBuilder: (_, int index) => _messages[index],
              padding: EdgeInsets.all(8),
              reverse: true,
              itemCount: _messages.length,
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0.8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0.4),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textEditingController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmitted(String text) {
    _textEditingController.clear();
    ChatMessage message = ChatMessage(text: text);
    setState(() {
      _messages.insert(0, message);
    });
  }
}


const String name = "Paul";

class ChatMessage extends StatelessWidget {
  final String text;
  ChatMessage({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text(name[0]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name, style: Theme.of(context).textTheme.subtitle1),
              Container(margin: EdgeInsets.only(top: 5.0), child: Text(text))
            ],
          )
        ],
      ),
    );
  }
}

//아직 제작중
