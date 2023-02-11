import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cupertino Store",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: CupertinoColors.black),
                    ),
                    Container(
                      height: 2,
                      color: CupertinoColors.inactiveGray,
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 10,
            child: Column(
                children: Global.home
                    .map(
                      (e) => Column(children: [
                        SizedBox(
                          height: 80,
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
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          color: CupertinoColors.black,
                        ),
                      ]),
                    )
                    .toList()),
          ),
        ],
      ),
    );
  }
}
