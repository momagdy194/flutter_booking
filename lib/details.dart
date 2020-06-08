import 'package:booking/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final Model data;

  Details(this.data);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .6,
          child: PageView.builder(itemBuilder: (context, index) {
            return Image.asset(
              widget.data.image,
              fit: BoxFit.cover,
            );
          }),
        ),
        _clotheButton(context),
        _buildPriceBar(),
        DraggableScrollableSheet(
          initialChildSize: .5,
          minChildSize: .5,
          maxChildSize: .6,
          builder: (context, controller) {
            return SingleChildScrollView(
              controller: controller,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                    ),
                    margin: EdgeInsets.only(top: 25),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Icon(
                            Icons.drag_handle,
                            color: Colors.black38,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            widget.data.location,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: _flatSize(),
                        ),
                        Divider(
                          height: 8,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: Text(
                            widget.data.description,
                            style: TextStyle(
                                color: Colors.grey, height: 1.2, fontSize: 16),
                          ),
                        ),
                        Divider(
                          height: 8,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SizedBox(
                            child: RaisedButton(
                              onPressed: () {},
                              child: Text(
                                'Book Now',
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: Colors.blue,
                              textColor: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width * .55,
                            height: 50,
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    alignment: Alignment.topRight,
                  )
                ],
              ),
            );
          },
        ),
      ]),
    );
  }

  _clotheButton(context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(right: 24, top: 45),
        child: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  _buildPriceBar() {
    return Container(
      margin: EdgeInsets.only(left: 24, top: 50),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.euro_symbol,
            size: 16,
            color: Colors.white,
          ),
          Text(
            widget.data.salary,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'months',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _flatSize() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'Livingroom',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text('80/M')
          ],
        ),
        Container(
          height: 50,
          width: 1,
          color: Colors.black38,
        ),
        Column(
          children: <Widget>[
            Text(
              'Bedroom',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text('20/M')
          ],
        ),
        Container(
          height: 50,
          width: 1,
          color: Colors.black38,
        ),
        Column(
          children: <Widget>[
            Text(
              'Bathroom',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text('12/M')
          ],
        ),
      ],
    );
  }
}
