import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter_dialogflow/v2/auth_google.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/page_transition.dart';

import 'chat_message.dart';
//import 'package:speech_recognition/speech_recognition.dart';

class Chat extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePageDialogflow(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePageDialogflow extends StatefulWidget {
  HomePageDialogflow({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageDialogflow createState() => new _HomePageDialogflow();
}

class _HomePageDialogflow extends State<HomePageDialogflow> {
  String resultText = "";
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(
                    Icons.send,
                    color: Color(0xFF3b7dfb),
                  ),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
//            new Container(
//              margin: new EdgeInsets.symmetric(horizontal: 4.0),
//              child: new IconButton(
//                icon: new Icon(Icons.mic),
//                onPressed: () {},
//              ),
//            )
          ],
        ),
      ),
    );
  }

  void Response(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/covid-bot-xahd-3d906f16c51a.json")
            .build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    ChatMessage message = new ChatMessage(
      text: response.getMessage() ??
          new CardDialogflow(response.getListMessage()[0]).title,
      name: "Bot",
      type: false,
    );
    print(message.text.toString());
    if (message.text.toString().contains('abc')) {
//      RaisedButton(
//        child: Text('click here'),
//        onPressed: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => SubPage()),
//          );
//        },
//      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dash()),
      );
    }
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "User",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    Response(text);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
              context,
//              PageTransition(
//                  type: PageTransitionType.leftToRight, child: Dash())
              MaterialPageRoute(
                builder: (context) => Dash(),
              )
//              ),
              ),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 80),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Bluebot",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Online",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
              ),
//              Container(
//                margin: EdgeInsets.fromLTRB(85, 0, 10, 0),
//                child: CircleAvatar(
//                    backgroundColor: Colors.blue[100],
//                    radius: 22,
//                    backgroundImage: AssetImage('images/app_logo.png')),
//              )
            ],
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Colors.white,
//              image: DecorationImage(
//                image: AssetImage("images/chatbot2.jpeg"),
//                fit: BoxFit.cover,
//                colorFilter: new ColorFilter.mode(
//                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
//              )
          ),
          child: new Column(children: <Widget>[
            new Flexible(
                child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )),
            new Divider(height: 1.0),
            new Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ]),
        ),
      ),
    );
  }
}
