// import 'package:player_redo/model/model.dart';

// enum Actions { next, prev, play, pause, stop }

// Model reducers(Model oldModel,Actions action) {

//   if(action == Actions.next){

//   }else if(action == Actions.prev){

//   }else if(action == Actions.play){

//   }else if(action == Actions.pause){

//   }else if(action == Actions.stop){

//   }else{

//   }
// }

import 'package:player_redo/model/model.dart';
import 'package:player_redo/reducers/action.dart';

Model reducers(Model oldModel, action) {
  if (action is AddCardAction) {
    oldModel.addCard();
    return oldModel;
  } else if (action is AddTextAction) {
    AddTextAction a = action;
    oldModel.addText(a.cardNo);
    return oldModel;
  } else {
    return oldModel;
  }
}
