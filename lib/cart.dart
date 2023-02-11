import 'package:flutter/cupertino.dart';

import 'global.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  TextEditingController nameController = TextEditingController();
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shopping Cart",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: CupertinoColors.black),
                    ),
                    Container(
                      height: 1,
                      color: CupertinoColors.inactiveGray.withOpacity(0.5),
                    )
                  ]),
            ),
          ),
          Expanded(
              flex: 7,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                CupertinoTextField(
                  prefix: Icon(
                    CupertinoIcons.person_solid,
                    color: CupertinoColors.black.withOpacity(0.2),
                    size: 28,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                  textCapitalization: TextCapitalization.words,
                  autocorrect: false,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0,
                        color: CupertinoColors.inactiveGray,
                      ),
                    ),
                  ),
                  style: TextStyle(color: CupertinoColors.black),
                  placeholder: ' Enter Name',
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.black.withOpacity(0.2),
                  ),
                  onChanged: (newName) {
                    setState(() {});
                  },
                ),
                CupertinoTextField(
                  prefix: Icon(
                    CupertinoIcons.mail_solid,
                    color: CupertinoColors.black.withOpacity(0.2),
                    size: 28,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                  clearButtonMode: OverlayVisibilityMode.editing,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0,
                        color: CupertinoColors.inactiveGray,
                      ),
                    ),
                  ),
                  style: TextStyle(color: CupertinoColors.black),
                  placeholder: ' Enter Email',
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.black.withOpacity(0.2),
                  ),
                ),
                CupertinoTextField(
                  prefix: Icon(
                    CupertinoIcons.location_solid,
                    color: CupertinoColors.black.withOpacity(0.2),
                    size: 28,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                  textCapitalization: TextCapitalization.words,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0,
                        color: CupertinoColors.inactiveGray,
                      ),
                    ),
                  ),
                  style: TextStyle(color: CupertinoColors.black),
                  placeholder: ' Enter Location',
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.black.withOpacity(0.2),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.clock,
                          color: CupertinoColors.lightBackgroundGray,
                          size: 28,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Delivery time',
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                            "${date.day}/${date.month}/${date.year}  ${date.hour}:${date.minute}")
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  alignment: Alignment.center,
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                            dateTimePickerTextStyle:
                                TextStyle(color: CupertinoColors.black))),
                    child: CupertinoDatePicker(
                      initialDateTime: date,
                      mode: CupertinoDatePickerMode.dateAndTime,
                      onDateTimeChanged: (e) {
                        date = e;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  child: SingleChildScrollView(
                    child: Column(
                        children: Global.cart
                            .map((e) => Container(
                                  height: 60,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            child: Image.asset(
                                              "${e['image']}",
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("${e['title']}"),
                                            Text(
                                              "\$${e['price']}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: CupertinoColors
                                                      .systemGrey),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Text("\$${e['total']}"))
                                    ],
                                  ),
                                ))
                            .toList()),
                  ),
                ),
                Container(
                  height: 2,
                  color: CupertinoColors.black.withOpacity(0.4),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Shipping \$21.0",
                      style: TextStyle(
                          fontSize: 15, color: CupertinoColors.systemGrey),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Tax \$10.0",
                      style: TextStyle(
                          fontSize: 15, color: CupertinoColors.systemGrey),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 18,
                          color: CupertinoColors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "\$${Global.finalBill}",
                      style: TextStyle(
                          fontSize: 18,
                          color: CupertinoColors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ]))
        ],
      ),
    );
  }
}
