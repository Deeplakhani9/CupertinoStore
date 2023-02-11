import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textController = TextEditingController(text: 'shirt');
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      color: CupertinoColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Container(
            width: 360,
            child: CupertinoSearchTextField(
              itemColor: CupertinoColors.black.withOpacity(0.3),
              suffixMode: OverlayVisibilityMode.always,
              suffixIcon: Icon(
                CupertinoIcons.clear_circled_solid,
                color: CupertinoColors.systemGrey,
              ),
              controller: textController,
              style: TextStyle(color: CupertinoColors.black),
              onSubmitted: (val) {
                setState(() {
                  Global.search = textController.text;
                });
              },
            ),
          ),
          Column(
            children: Global.shirt
                .map(
                  (e) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                    "${e['image']}",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${e['title']}"),
                                  Text(
                                    "\$${e['price']}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: CupertinoColors.systemGrey),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: CupertinoButton(
                                  child: Icon(CupertinoIcons.add_circled),
                                  onPressed: () {
                                    Global.cart.add(e);
                                    setState(() {
                                      e['i']++;
                                      e['total'] = e['price'] * e['i'];

                                      Global.totalBill += e['total'];

                                      Global.finalBill = Global.totalBill +
                                          Global.shipping +
                                          Global.tax;
                                    });
                                  }),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: CupertinoColors.black,
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
