import 'package:flutter/material.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/lang_data/numbers.dart';
import 'package:handrills/widgets/shared/hd_number_block.dart';

import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_sub_header.dart';

class NumberChart extends StatelessWidget {
  final TextStyle boldStyle = TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final screenHeight = Nrs.getScreenHeight();

    return Scaffold(
        appBar: Nrs.NrsAppBar(title: HD.t('numberChart'), context: context),
        body: Column(
          children: <Widget>[
            NSubHeader(HD.t('nativeNumbers')),
            SizedBox(
              height: screenHeight * 0.25,
              child: getNativeNumberChart(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: NSubHeader(HD.t('sinoNumbers')),
            ),
            SizedBox(
              height: screenHeight * 0.4,
              child: getSinoNumberChart(context),
            )
          ],
        ));
  }

  getNativeNumberChart(BuildContext context) {
    List<HanNumber> numbers = [];
    var maxNum = 100;

    for (int i = 0; i <= maxNum; i++) {
      var hn = HD.getSinoNumber(i);
      var written = hn.alternate == hn.written ? hn.written : '${hn.written}';
      var kanji = hn.alternate == hn.alternate ? hn.alternate : '${hn.alternate}';
      numbers.add(HanNumber(digit: hn.digit, written: written, alternate: kanji));
    }
    return Center(
      child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        maxCrossAxisExtent: 130.0,
        children: <Widget>[
          ...nativeNumberBank.getRange(1, 11).map((e) => HDNumberBlock(
              digit: e.digit, numberList: [e.alternate,e.written]))
        ],
      ),
    );
  }

  getSinoNumberChart(BuildContext context) {
    List<HanNumber> numbers = [];
    var maxNum = 100;

    for (int i = 0; i <= maxNum; i++) {
      var hn = HD.getSinoNumber(i);
      var written = hn.alternate == hn.written ? hn.written : '${hn.written}';
      var kanji = hn.alternate == hn.alternate ? hn.alternate : '${hn.alternate}';
      numbers.add(HanNumber(digit: hn.digit, written: written, alternate: kanji));
    }

    return Center(
      child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        maxCrossAxisExtent: 130.0,
        children: <Widget>[
          ...numbers.getRange(0, 101).map((e) => HDNumberBlock(
              digit: e.digit, numberList: [e.alternate, e.written]))
        ],
      ),
    );
  }
}
