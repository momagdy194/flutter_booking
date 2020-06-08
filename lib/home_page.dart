import 'package:booking/details.dart';
import 'package:booking/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> pages = List<Model>();

  void addPages() {
    pages.add(
      Model(
          'Cairo',
          'images/1.jpg',
          '800',
          'Geate Location in good place,Bush park, State University for creative student.'
              'Gooed palce to make friend.Easy to park your car. Cairo center.',
          '95',
          'Single Flat'),
    );
    pages.add(
      Model(
          'Elgiza',
          'images/2.jpg',
          '700',
          'Geate Location in good place,Bush park, State University for creative student.'
              'Gooed palce to make friend.Easy to park your car. Elgiza center.',
          '85',
          'Double family house'),
    );
    pages.add(
      Model(
          'Mansoura',
          'images/3.jpg',
          '500',
          'Geate Location in good place,Bush park, State University for creative student.'
              'Gooed palce to make friend.Easy to park your car. Mansoura center.',
          '55',
          'Single Flat'),
    );
    pages.add(
      Model(
          'Alex',
          'images/4.jpg',
          '900',
          'Geate Location in good place,Bush park, State University for creative student.'
              'Gooed palce to make friend.Easy to park your car. Alex center.',
          '94',
          'Double family house'),
    );
  }

  @override
  void initState() {
    addPages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Find your flat',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black38,
            ),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.black38,
              ),
              onPressed: () {}),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black38,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('data'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('data'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('data'),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                '${pages.length} result in yor area',
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: pages.length,
                itemBuilder: (Context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return Details(
                            pages[index],
                          );
                        }),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      height: 250,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: ExactAssetImage(pages[index].image),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 7,
                                    spreadRadius: 1,
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.transparent,
                                            Colors.black38
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 12,
                                        left: 40,
                                        right: 12,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .25,
                                            child: Text(
                                              pages[index].location,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.directions,
                                              size: 24,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            // details
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .43,
                              height: 200,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 7,
                                    spreadRadius: 1,
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        Icons.euro_symbol,
                                        size: 18,
                                      ),
                                      Text(
                                        pages[index].salary,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'months',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    pages[index].countain,
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${pages[index].reviews}/reviews',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          image: DecorationImage(
                                            image:
                                                AssetImage(pages[index].image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          image: DecorationImage(
                                            image:
                                                AssetImage(pages[index].image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.black38,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '23+',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        margin: EdgeInsets.only(
                                            bottom: 6, right: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Text(
                                          'dishwasher',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        margin: EdgeInsets.only(
                                            bottom: 6, right: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Text(
                                          'led-tv',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        margin: EdgeInsets.only(
                                            bottom: 6, right: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Text(
                                          'wi-fi',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
