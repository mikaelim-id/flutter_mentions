import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (_, child) => Portal(child: child!),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ElevatedButton(
            child: Text('Get Text'),
            onPressed: () {
              print(key.currentState!.controller!.markupText);
            },
          ),
          Container(
            child: FlutterMentions(
              key: key,
              suggestionPosition: SuggestionPosition.Top,
              maxLength: 10000,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(hintText: 'hello'),
              mentions: [
                Mention(
                  trigger: '@',
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                  data: [
                    {
                      'id': '61as61fs1',
                      'display': 'Candra',
                      'full_name': 'Fayeed Pawaskar',
                      'photo':
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                    },
                    {
                      'id': '61as61fsa',
                      'display': 'Candranaya',
                      'full_name': 'Fayeed Pawaskar',
                      'photo':
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                    },
                    {
                      'id': 'asfgasga41',
                      'display': 'fayeed',
                      'full_name': 'Mark Twain',
                      'photo':
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                    },
                    {
                      'id': '61asasgasgsag6a',
                      'display': 'fay',
                      'full_name': 'DJ Khaled',
                      'photo':
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                    },
                    {
                      'id': 'asfsaf451a',
                      'display': 'JhonL',
                      'full_name': 'Jhon Legend',
                      'photo':
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                    },
                  ],
                  matchAll: false,
                ),
                Mention(
                  trigger: '#',
                  disableMarkup: true,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  data: [
                    {'id': 'reactjs', 'display': 'reactjs'},
                    {'id': 'javascript', 'display': 'javascript'},
                  ],
                  matchAll: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
