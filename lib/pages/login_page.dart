import 'package:sydbank_flutter_clone/components/white_line.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final String dot = "•";
final String dash = "-";

class _LoginPageState extends State<LoginPage> {
  final LocalAuthentication auth = LocalAuthentication();
  bool initialBuild = true;

  String visibleCode = "";
  String code = "";

  Future<void> _handleFingerPrintAuth(BuildContext context) async {
    try {
      bool authenticated = await auth.authenticateWithBiometrics(
        localizedReason: 'Brug fingeraftryksscanneren til at logge ind.',
        useErrorDialogs: true,
        stickyAuth: true,
      );

      if (authenticated) {
        Navigator.of(context).pushReplacementNamed("/home");
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  initState() {
    super.initState();
    visibleCode = "";
    code = "";
  }

  _handleNumberPress(BuildContext context, int number) {
    if (code.length == 6) {
      return;
    }

    setState(() {
      visibleCode = dot * code.length + number.toString();
      code = code + number.toString();
    });
    final index = code.length - 1;
    Future.delayed(
      const Duration(milliseconds: 400),
      () {
        setState(() {
          if (index == visibleCode.length - 1) {
            visibleCode = visibleCode.replaceRange(index, index + 1, dot);
          }
        });
      },
    );

    if (code.length == 6) {
      // TODO HANDLE API CALL
      print("code: $code");
      Navigator.of(context).pushReplacementNamed("/home");
    }
  }

  _handleDelete() {
    setState(() {
      code = code.substring(0, code.length - 1);
      visibleCode = dot * code.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (initialBuild) {
      this.initialBuild = false;
      _handleFingerPrintAuth(context);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(),
        title: Text("Log ind"),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.info_outline),
            onPressed: () {
              print("press settings");
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.more_vert),
            onPressed: () {
              print("press settings");
            },
          ),
        ],
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    WhiteLine(),
                    Text(
                      "Tast din mobilkode",
                      style: Theme.of(context).textTheme.display1,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Bruger-id 070396-xxxx",
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.shade200.withAlpha(200),
                alignment: Alignment.center,
                child: Text(
                  visibleCode.padRight(6, dash),
                  style: TextStyle(
                    fontSize: 40,
                    letterSpacing: 20,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 32),
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                  size: 48,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 2,
                    crossAxisCount: 3,
                    children: <Widget>[
                      _numberButton(context, 1),
                      _numberButton(context, 2),
                      _numberButton(context, 3),
                      _numberButton(context, 4),
                      _numberButton(context, 5),
                      _numberButton(context, 6),
                      _numberButton(context, 7),
                      _numberButton(context, 8),
                      _numberButton(context, 9),
                      KeyPadButton(
                        child: Icon(Icons.fingerprint, color: Colors.white),
                        onTap: () => _handleFingerPrintAuth(context),
                      ),
                      _numberButton(context, 0),
                      KeyPadButton(
                        child: Icon(Icons.backspace, color: Colors.white),
                        onTap: _handleDelete,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _numberButton(context, int number) => KeyPadButton(
        child: Text(number.toString()),
        onTap: () => _handleNumberPress(context, number),
      );
}

class KeyPadButton extends StatelessWidget {
  final Widget child;
  final GestureTapCallback onTap;

  const KeyPadButton({Key key, this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.black.withAlpha(200),
      shape: Border.all(
        color: Colors.white,
        width: 0.1,
      ),
      child: InkWell(
        splashColor: Colors.white,
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
