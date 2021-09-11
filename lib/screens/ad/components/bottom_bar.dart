import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/ad.dart';

class BottomBar extends StatelessWidget {
  final Ad ad;
  BottomBar(this.ad);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 26),
            height: 38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Colors.orange,
            ),
            child: Row(
              children: [
                if (!ad.hidePhone)
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        final phone =
                            ad.user.phone.replaceAll(RegExp('[^0-9]'), '');
                        launch('tel:$phone');
                      },
                      child: Container(
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: Text(
                          'Ligar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 25,
                      alignment: Alignment.center,
                      child: Text(
                        'Chat',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(249, 249, 249, 1),
                border: Border(top: BorderSide(color: Colors.grey[400]))),
            height: 38,
            alignment: Alignment.center,
            child: Text(
              '${ad.user.name} (anunciante)',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
