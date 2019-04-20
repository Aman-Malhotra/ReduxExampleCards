import 'package:player_redo/widgets/rCard.dart';

class CardItem {
  RCard rCard;
  int cardNo;
  int textCount = 0;

  CardItem(this.cardNo) {
    rCard = RCard(textCount, cardNo);
  }

  addText() {
    ++ this.textCount;
    this.rCard = RCard(textCount, cardNo);
  }
}
