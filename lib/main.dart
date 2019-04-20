// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//       runApp(
//         MainPage()
//       );
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:player_redo/model/model.dart';
import 'package:player_redo/reducers/action.dart';
import 'package:redux/redux.dart';
import 'package:player_redo/reducers/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store store = Store<Model>(reducers, initialState: Model([]));
  @override
  Widget build(BuildContext context) {
    return StoreProvider<Model>(
      store: store,
      child: MaterialApp(home: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<Model, Model>(
        converter: (store) => store.state,
        builder: (context, state) {
          return PageView.builder(
            itemCount: state.cardList.length + 1,
            reverse: true,
            itemBuilder: (c, i) {
              if (i == 0) {
                return Card(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      StoreConnector<Model, Function>(
                        converter: (store) {
                          return () => store.dispatch(AddCardAction());
                        },
                        builder: (context, callback) {
                          return IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              callback();
                            },
                          );
                        },
                      )
                    ],
                  ),
                );
              } else {
                return state.cardList[i - 1].rCard;
                // return Container();
              }
            },
          );
        },
      ),
    );
  }
}
