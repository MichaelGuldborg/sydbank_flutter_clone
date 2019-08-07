import 'package:sydbank_flutter_clone/components/white_line.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.settings),
          onPressed: () {
            print("press settings");
          },
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.insert_drive_file),
            onPressed: () {
              print("press settings");
            },
          ),
        ],
      ),
      bottomSheet: Container(
        width: double.maxFinite,
        height: 50,
        color: Colors.white,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Hvad kan vi gøre for dig?",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue.shade900,
              ),
            ),
            Text(
              "Sydbank",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
                color: Colors.blue.shade900,
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Image.asset(
              'assets/images/jungle_bridge.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                SizedBox(height: 200),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400.withAlpha(200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      WhiteLine(),
                      Text(
                        "Velkommen",
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ],
                  ),
                ),
                _button("Kontooverblik"),
                _button("Forbrugsoverblik"),
                _button("Depoter og puljer"),
                _button("Overfør penge"),
                _button("Bolig"),
                _button("Sydbank Favorit"),
                _button("Faste betalinger"),
                _button("Betal regning"),
                _button("Investering"),
                _button("Kontakt"),
                _button("Valuta"),
                _button("Kortoversigt"),
                _button("Pension"),
                _button("Indstillinger"),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _button(String text) => Material(
        color: Colors.black.withAlpha(80),
        shape: Border(
          bottom: BorderSide(
            color: Colors.white30,
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
}
