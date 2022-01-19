import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:mymarketing/data/productData.dart';
import 'package:mymarketing/widget_custom/mainDrawer.dart';
import 'detailsview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectNavPosiotion = 1;

  final List<String> imaglist = [
    'https://raw.githubusercontent.com/Rifat470809/Image/master/my.png',
    'https://raw.githubusercontent.com/Rifat470809/Image/master/bg.jpg',
    'https://raw.githubusercontent.com/Rifat470809/Image/master/bg2.jpg',
    'https://raw.githubusercontent.com/Rifat470809/Image/master/bg3.jpg',
    'https://raw.githubusercontent.com/Rifat470809/Image/master/bg4.jpg',
    'https://raw.githubusercontent.com/Rifat470809/Image/master/bg5.jpg'
  ];

  /*All product list */
  /*final List<productListModel> productlist = [
    productListModel(1, "Product 1", "Bangladesh, to the east of India on the Bay of Bengal, is a South Asian country marked by lush greenery and many waterways. Its Padma (Ganges), Meghna and Jamuna rivers create fertile plains, and travel by boat is common. On the southern coast, the Sundarbans, an enormous mangrove forest shared with Eastern India, is home to the royal Bengal tiger.Bangladesh, to the east of India on the Bay of Bengal, is a South Asian country marked by lush greenery and many waterways. Its Padma (Ganges), Meghna and Jamuna rivers create fertile plains, and travel by boat is common. On the southern coast, the Sundarbans, an enormous mangrove forest shared with Eastern India, is home to the royal Bengal tiger.Bangladesh, to the east of India on the Bay of Bengal, is a South Asian country marked by lush greenery and many waterways. Its Padma (Ganges),Bangladesh, to the east of India on the Bay of Bengal, is a South Asian country marked by lush greenery and many waterways. Its Padma (Ganges), Meghna and Jamuna rivers create fertile plains, and travel by boat is common. On the southern coast, the Sundarbans, an enormous mangrove forest shared with Eastern India, is home to the royal Bengal tiger.", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(2, "Product 2", "Product 2 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(3, "Product 3", "Product 3 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(4, "Product 4", "Product 4 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(5, "Product 5", "Product 5 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(4, "Product 4", "Product 4 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(5, "Product 5", "Product 5 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(6, "Product 6", "Product 6 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg')
  ];*/

  var pdata = new productdata();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Home'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.camera),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 150,
              child: CarouselSlider.builder(
                  slideBuilder: (index) {
                    return Container(
                      child: Image.network(
                        imaglist[index],
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  slideTransform: CubeTransform(),
                  slideIndicator: CircularSlideIndicator(
                      padding: EdgeInsets.only(bottom: 8)),
                  autoSliderDelay: Duration(seconds: 5),
                  enableAutoSlider: true,
                  unlimitedMode: true,
                  itemCount: imaglist.length),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                  //physics: NeverScrollableScrollPhysics(),
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  itemCount: pdata.productlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      //childAspectRatio:  .90,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsView(pdata.productlist[index])));
                      },
                      child: Card(
                        elevation: 20,
                        child: Column(
                          children: [
                            Container(
                              child: Image.network(
                                  pdata.productlist[index].imageUrl),
                            ),
                            Text(pdata.productlist[index].title)
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class AppBars extends AppBar {
  AppBars()
      : super(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: Text(
            "this is app bar",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () => null,
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () => null,
            ),
          ],
        );
}
