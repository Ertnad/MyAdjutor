import 'package:flutter/cupertino.dart';
import '../../disign/dimensions.dart';
import 'train_item.dart';

class TrainList extends StatelessWidget {
  const TrainList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[_list(), _updateButton()]);
  }

  Widget _list() {
    return ListView.separated(
      itemCount: 6,
      padding: const EdgeInsets.only(
          left: padding16, top: padding16, right: padding16),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: height8);
      },
      itemBuilder: (BuildContext context, int index) {
        return const TrainItem();
      },
    );
  }

  Widget _updateButton() {
    return Container();
  }
}
