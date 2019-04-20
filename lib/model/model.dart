// import 'package:flute_music_player/flute_music_player.dart';

// class PlayerData {
//   List<Song> allSongs = [];
//   MusicFinder audioPlayer;
//   Duration duration;
//   PlayerData() {
//     audioPlayer = new MusicFinder();
//     audioPlayer.setCompletionHandler(() {
//       onComplete();
//     });
//     audioPlayer.setDurationHandler((d) {
//       duration = d;
//     });
//   }
//   onComplete(){

//   }
//   initData() {}

//   getSongs() async {
//     allSongs = await MusicFinder.allSongs();
//   }
// }

import 'package:player_redo/model/cardItem.dart';

class Model {
  List<CardItem> cardList = [];

  Model(List<CardItem> list) {
    this.cardList = list;
  }

  addCard() {
    cardList.add(CardItem(cardList.length));
    print("Length of the card list = " + cardList.length.toString());
    reorder();
  }

  addText(int cardNo) {
    // cardList.removeWhere((c) => c.cardNo == cardNo);
    print("Length of the card list = " + cardList.length.toString());
    cardList = cardList.map((c) {
      if (c.cardNo == cardList[cardNo].cardNo) {
        print(
            "Text added in card no ${cardList.indexOf(c)} and new text count is ${cardList[cardNo].textCount}");
        c.addText();
      }else{
        print("No text added in card no ${cardList.indexOf(c)}");
      }
      return c;
    }).toList();
    // cardList.add(CardItem(cardNo));
    reorder();
  }
  reorder (){
    cardList.sort((a, b)=>a.cardNo.compareTo(b.cardNo));
  }
}
