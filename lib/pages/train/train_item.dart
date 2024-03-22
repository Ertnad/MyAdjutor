import 'package:flutter/material.dart';
import 'package:myadjutor/disign/colors.dart';

import '../../disign/dimensions.dart';

class TrainItem extends StatelessWidget {
  const TrainItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height64,
      child: Card(
        color: Colors.red,
        margin: EdgeInsets.zero,
        elevation: elevation006,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius8)),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius8),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: padding8, right: padding16),
            child: Row(children: <Widget>[
              Image.asset(
                'assets/images/train.png',
                width: 50,
                height: 50,
              ),
              _title(),
              _state()
            ]),
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: padding6, right: padding6),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('BMddfdf',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: fontSize14,
                      fontWeight: FontWeight.w600)),
              if (false)
                const Text('No Boba',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: secondaryVariantColor,
                        fontSize: fontSize14,
                        fontWeight: FontWeight.w400))
              else
                RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: const TextSpan(
                        style: TextStyle(fontSize: fontSize14),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Driver: ',
                              style: TextStyle(
                                color: secondaryVariantColor,
                                fontWeight: FontWeight.w400,
                              )),
                          TextSpan(
                              text: 'Райн Гослинг',
                              style: TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.w600,
                              )),
                        ]))
            ]),
      ),
    );
  }

  Widget _state() {
    return InkWell(
      onTap: () {},
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/train.png',
              width: 30,
              height: 30,
            ),
            const Text(
              'умер',
              style: TextStyle(
                  color: secondaryVariantColor,
                  fontSize: fontSize12,
                  fontWeight: FontWeight.w400),
            )
          ]),
    );
  }
}
