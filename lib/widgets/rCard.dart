import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:player_redo/model/model.dart';
import 'package:player_redo/reducers/action.dart';

class RCard extends StatefulWidget {
  final int textCount;
  final int cardNo;
  RCard(this.textCount, this.cardNo);
  @override
  _RCardState createState() => _RCardState();
}

class _RCardState extends State<RCard> {
  @override
  Widget build(BuildContext context) {
    print("Card opened no :- " + widget.cardNo.toString());
    return Card(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          StoreConnector<Model, Function>(
            converter: (store) {
              return () => store.dispatch(AddTextAction(widget.cardNo));
            },
            builder: (context, callback) {
              return IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  callback();
                },
              );
            },
          ),
          ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.textCount + 1,
            itemBuilder: (c, i) {
              return Center(
                  child: i == 0
                      ? Text("Card No ${widget.cardNo} \nTitle ")
                      : Text("Text"));
            },
          ),
        ],
      ),
    );
  }
}
