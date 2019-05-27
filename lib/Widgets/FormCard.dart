import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'globals.dart' as globals;

final myController = TextEditingController();
final myController2 = TextEditingController();
//class MainPage extends StatefulWidget{
//  FormCard createState()=> FormCard();
//}

//class HomePage extends State<MainPage>{
//Your code here
//}

//class FormCard extends State<MainPage>{
class FormCard extends StatelessWidget {
//class FormCard extends StatefulWidget {
//class FormCard extends State<MyApp> {
  //bool _isSelected = false;

  bool _checked = true;

  void _onCheck(val) {
    _checked = val;
    //setState();
    // setState(() {
    //   _checked = val;
    // });
  }

  void _radio() {
    //setState(() {
    //_isSelected = !_isSelected;
    //});
  }

  void _check() {
    //setState(() {
    //_isSelected = !_isSelected;
    //});
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(350),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /*---------------------------------------
            Text("Login",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
			----------------------------------*/
            /*===========================================================================================
            Text("Username",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
		===========================================================================================*/

            TextField(
              decoration: InputDecoration(
                  hintText: "Email Address",
                  icon: Icon(Icons.email),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              controller: myController,
              onChanged: (newValue) {
                globals.email = newValue;
                //newValue = newValue;
              },
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            /*===========================================================================================

            Text("PassWord",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
		===========================================================================================*/

            TextField(
              obscureText: true,
              keyboardType: TextInputType.number,
              //maxLength: 4,
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
              ],
              decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Last 4 digit SSN",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
              controller: myController2,
              onChanged: (newValue2) {
                globals.password = newValue2;
                //newValue = newValue;
              },
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35), //35
            ),
            //       Row(children: <Widget>[Text("")]),
            // SizedBox(
            //   height: ScreenUtil.getInstance().setHeight(35), //35
            // ),

/*-------------------------------------------			
			,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(28)),
                )
              ],
            )
--------------------------------------------*/

/*#####################################################################
				,
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Checkbox(value: _checked, onChanged: (val) => _onCheck(val)),
                Text("Remember me"
,                              style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(26), fontFamily: "Poppins-Medium"))
								  
				]
				)		

#####################################################################*/
          ],
        ),
      ),
    );
  }
}
