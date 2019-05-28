import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Widgets/FormCard.dart';
import 'Widgets/SocialIcons.dart';
import 'CustomIcons.dart';
//import 'package:alert_dialog/main.dart';
import 'package:flutter/services.dart';
import 'Widgets/globals.dart' as globals;
import './SecondScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final myController = TextEditingController();

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));
  });
}

//void main() => runApp(MaterialApp(
//      home: MyApp(),
//      debugShowCheckedModeBanner: false,
//    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSelected = false;
  bool _checked = false;
  int _index = 0;
  String _value = '';
  List<BottomNavigationBarItem> _items;

  void _onCheck(val) {
    setState(() {
      _checked = val;
      saveData((val == true) ? 1 : 0);
      /*-----
       _checked = (val == true) ? true:false;
      //saveData(val);
      -----*/
    });
  }

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  void _check() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  int itemNo = 0;

  @override
  void initState() {
    super.initState();
//    SharedPreferences.getInstance().then((sp) {
//      sp.setInt("itemNo", 3);
//    });
    SharedPreferences.getInstance().then((sp) {
      print("sp " + sp.getInt("my_int_key").toString());
      _onCheck((sp.getInt("my_int_key") == 1) ? true : false);
      if(sp.getInt("my_int_key") == 1) {
        readEmailData();
      }
      
      //globals.gloablmyController.text = "XYZ@abc.com";
      setState(() {
        itemNo = sp.getInt("itemNo");
      });
    });
    print("This is the item number " + itemNo.toString());
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      bottomSheet: Container(
          color: Colors.blueAccent,
          padding: EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Version 2.0.0 \n \u00a9 2019 Olympic Computer Services, Inc. All rights reserved. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10.0,
                      backgroundColor: Colors.blueAccent,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              // Text('\u00a9 2019 Olympic Computer Services, Inc. All rights reserved. ',
              //                               style: TextStyle(
              //                                   fontSize: 14.0,
              //                                   color: Colors.white,
              //                                   fontWeight: FontWeight.bold)),
            ],
          )),

      /*================*/
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset("assets/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset("assets/image_02.png")
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/logo.png",
                        width: ScreenUtil.getInstance().setWidth(110),
                        height: ScreenUtil.getInstance().setHeight(110),
                      ),
                      Text("  Good morning, Nayan",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(32),
                              letterSpacing: .6
                              //,
                              //fontWeight: FontWeight.bold
                              ))
                    ],
                  ),
                  //Row(                    children: <Widget>[Text("")]),
                  //Row(                    children: <Widget>[Text("")]),
                  Row(children: <Widget>[Text("")]),
                  //Row(                    children: <Widget>[]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Welcome to",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(32),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Olympic Paycheck",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium",
                              fontSize: ScreenUtil.getInstance().setSp(32),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))
                    ],
                  ),

                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(60),
                  ),
                  FormCard(),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.end, // .spaceBetween,
                              children: [
                                Checkbox(
                                    value: _checked,
                                    onChanged: (val) => _onCheck(val)),
                                Text("Remember me       " + " ",
                                    style: TextStyle(
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(26),
                                        fontFamily: "Poppins-Medium")),
                                RaisedButton(
                                  //onPressed: () => {debugPrint('RaisedButton Pressed123')},
                                  onPressed: () => {
                                        // debugPrint('RaisedButton Pressed123456');
                                        //return
                                        /*==================================*/
                                        /*===
                                        _value = ((globals.email == "") ||
                                                          (globals.password ==
                                                              ""))
                                                      ? "Please enter a valid email/password and try again."
                                                      : "Login successful.",
                                                      ===*/
                                        if ((globals.email == "") ||
                                            (globals.password == ""))
                                          {
// {
//         final prefs = await SharedPreferences.getInstance();
//         final key = 'my_int_key';
//         final value = 42;
//         prefs.setInt(key, value);
//         print('saved $value');
//       }

                                            print('read1: '),
                                            saveEmailData(globals.email),
                                            //saveData(),
                                            readData(),
                                            showDialog(
                                                context: context,
                                                child: AlertDialog(
                                                  title: const Text('Login'),
                                                  content: Text(

                                                      //globals.email

                                                      ((globals.email == "") ||
                                                              (globals.password ==
                                                                  ""))
                                                          ? "Please enter a valid email/password and try again."
                                                          : "Login successful."),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context, true);
                                                      },
                                                      child:
                                                          const Text('Close'),
                                                    )
                                                  ],
                                                ) //;ALertDialog

                                                ) //showDialog
                                          }
                                        else
                                          {
                                            print('read2: '),
                                            saveEmailData(globals.email),
                                            //saveData(),
                                            readData(),                                            
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          SecondScreen(),
                                                ))
                                          }

                                        /*===================================*/
                                        /*#######################################################*/
                                        /////////////////////////////////////////////////////////////////////////////////////,
                                        /*#######################################################*/
                                      },

                                  child: Text('Log In',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                          backgroundColor: Colors.blueAccent,
                                          fontWeight: FontWeight.bold)),
                                  //color: Theme.of(context).accentColor,
                                  color: Colors.blueAccent,
                                ),
                                //,
                                //const Text("Log In")
                              ]),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),

                  Row(children: <Widget>[Text("")]),
                  Row(children: <Widget>[Text("")]),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center, // .spaceBetween,
                              children: [
                                FlatButton(
                                  //onPressed: () => {debugPrint('RaisedButton Pressed123')},
                                  onPressed: () => {
                                        // debugPrint('RaisedButton Pressed123456');
                                        //return
                                        showDialog(
                                            context: context,
                                            child: AlertDialog(
                                              title: const Text(
                                                  'Terms & Conditions'),
                                              content: Text(

                                                  //globals.email

                                                  '=== On the Way ==='),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, true);
                                                  },
                                                  child: const Text('Close'),
                                                )
                                              ],
                                            ) //;ALertDialog

                                            ) //showDialog
                                      },

                                  child: Text('Privacy & Terms',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold)),
                                  //color: Theme.of(context).accentColor,
                                  color: Colors.white,
                                ),
                                //,
                                //const Text("Log In")
                              ]),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  )
                ],
              ),
            ),
          ),

          /*----------------------------------*/
          // new BottomNavigationBar(
          //     items: _items,
          //     fixedColor: Colors.blue,
          //     currentIndex: _index,
          //     onTap: (int item){
          //       _index = item;
          //       _value = "Current value is: ${_index.toString()}";
          //     },
          // )

          /*------------------------------------*/
        ],
      ),

      /*==========================
                                                appBar: new AppBar(
                                                  title: new Text('Name here'),
                                                  backgroundColor: Colors.red,
                                                ),
                                                //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
                                                body2: new Container(
                                                  padding: new EdgeInsets.all(32.0),
                                                  child: new Center(
                                                    child: new Column(
                                                      children: <Widget>[
                                                        new Text(_value)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                bottomNavigationBar: new BottomNavigationBar(
                                                    items: _items,
                                                    fixedColor: Colors.blue,
                                                    currentIndex: _index,
                                                    onTap: (int item){
                                                      _index = item;
                                                      _value = "Current value is: ${_index.toString()}";
                                                    },
                                                )    
                                              
                                              
                                              =======================*/
    );
  }

  saveData(int aVal) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value = aVal;
    prefs.setInt(key, value);
    print('saved $value');
  }

  readData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value = prefs.getInt(key) ?? 0;
    print('read: $value');
    _onCheck((value == 1) ? true : false);
  }

  saveEmailData(String aVal) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_stringEmail_key';
    final value = aVal;
    prefs.setString(key, value);
    print('saved $value');
  }

  readEmailData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_stringEmail_key';
    final value = prefs.getString(key) ?? "";
    
    globals.gloablmyController.text = value;


    globals.email = value;
    print('read: $value');
    //_onCheck(value);
  }




}
