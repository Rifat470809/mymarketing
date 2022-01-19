import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mymarketing/Auth/developer.dart';
import 'package:mymarketing/ecommerce/home.dart';
import 'package:mymarketing/modelClass/productListmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Invoice extends StatefulWidget {
  final productListModel proDetails;
  int orderNo;

  Invoice(this.proDetails, this.orderNo);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  String name = '';
  String mobile = '';
  String address = '';
  String pass = '';

  @override
  void initState() {
    // TODO: implement initState
    //   getShapref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 45,
              width: 155,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: Builder(builder: (context) {
                return Container(
                    child: Center(
                        child: Text(
                  'Billing Summery',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )));
              }),
            ),

            /*     Container(
              height: MediaQuery.of(context).size.height/4,
              color: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.only(left: 18,right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Center(child: Text('Invoice no : 1000',style: TextStyle(color: Colors.white,fontSize: 20))),
                    Divider(thickness: 1,color: Colors.white),
                    SizedBox(height: 8,),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Name : $name',style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.left,)),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Mobile : $mobile',style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.left,)),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Address : $address',style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.left,)),

                  ],
                ),
              ),
            ), */
            Card(
              elevation: 1,
              child: Container(
                height: 100,
                child: ListTile(
                  leading: Image.network(
                    '${widget.proDetails.imageUrl}',
                    fit: BoxFit.cover,
                  ),
                  title: Align(
                      alignment: Alignment.centerRight,
                      child: Text('${widget.proDetails.title}')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.teal)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              'Price of Product    :       ${widget.proDetails.price}',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16))),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              'Number of order    :       ${widget.orderNo}',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16))),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              'Total Discount    :       ${widget.proDetails.discount}',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16))),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              'Unit of Product     :   ${widget.proDetails.unit}',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16))),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(thickness: 1, color: Colors.pink),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              'Net Bill    :       ${(widget.proDetails.price * widget.orderNo) - widget.proDetails.discount}',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 20))),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(color: Colors.teal),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context,
                            MaterialPageRoute(builder: (context) => Home()));
                        Fluttertoast.showToast(
                            msg: 'Order Successfully',
                            toastLength: Toast.LENGTH_LONG);
                        /* Navigator.pop(context); */
                      },
                      child: Text('Payment',
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                ),
                Container(
                  width: 160,
                  decoration: BoxDecoration(color: Colors.teal),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context,
                            MaterialPageRoute(builder: (context) => Home()));
                        Fluttertoast.showToast(
                            msg: 'Order Successfully',
                            toastLength: Toast.LENGTH_LONG);
                        /* Navigator.pop(context); */
                      },
                      child: Text('Cash In Delivery',
                          style: TextStyle(color: Colors.white, fontSize: 16))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  getShapref() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      name = pref.getString('user_name')!;
      mobile = pref.getString('user_mobile')!;
      address = pref.getString('user_address')!;
      pass = pref.getString('pass')!;
    });
  }
}
