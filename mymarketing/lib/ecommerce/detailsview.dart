import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymarketing/modelClass/productListmodel.dart';

import 'Invoice.dart';

class DetailsView extends StatefulWidget {
  final productListModel proDetails;

  DetailsView(this.proDetails);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Product Details'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 8,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: Image.network(
                            widget.proDetails.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 6,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Product title",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Price : \$ ${widget.proDetails.price}"),
                                    Text(
                                        "Discount : ${widget.proDetails.discount} %"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.proDetails.desc,
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                )),
            Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.teal,
                        )),
                    height: MediaQuery.of(context).size.height / 10,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (count >= 0) {
                                        count--;
                                      }
                                    });
                                  },
                                  child: Center(
                                      child: Text('-',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)))),
                              VerticalDivider(
                                thickness: 1,
                              ),
                              Center(child: Text('$count')),
                              VerticalDivider(
                                thickness: 1,
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (count < 10) {
                                        count++;
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Sorry you cant more order",
                                            toastLength: Toast.LENGTH_LONG);
                                      }
                                    });
                                  },
                                  child: Center(
                                      child: Text('+',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20)))),
                            ],
                          ),
                        ),

                        //VerticalDivider(thickness: 1,color: Colors.indigo,),
                        Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.teal,
                              child: Center(
                                  child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Invoice(
                                              widget.proDetails, count)));
                                },
                                child: Text(
                                  'Add To Cart',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )),
                            ))
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
