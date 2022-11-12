import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:itcm_site/pressors/pressor_button.dart';
import 'package:itcm_site/shared_views/secondary_title.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:itcm_site/design/app_colors.dart';
import 'package:itcm_site/design/app_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:itcm_site/extensions/hover_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/orientation_helper.dart';
import '../../helpers/navigation_helper.dart';
import '../../data/constants.dart';

class ContactUs extends StatefulWidget {
  _ContactUs createState() => _ContactUs();
}

class _ContactUs extends State<ContactUs> {
  String _name, _email, _subject, _description;
  var _controllerName = new TextEditingController();
  var _controllerEmail = new TextEditingController();
  var _controllerSubject = new TextEditingController();
  var _controllerDescription = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        setScreenSize(sizingInformation.deviceScreenType);
        return Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SecondaryTitle('צור קשר'),
                _getInfoAreaWidget(),
                Container(height: 2, color: blueColor),
                _getInputAreaWidget(),
              ],
            ),
          ],
        );
      },
    );
  }

  _copyToClipboard(String copyTex) {
    Clipboard.setData(ClipboardData(text: copyTex));
    _showAlertDialog('הועתק');
  }

  _sendWhatsapp(String copyTex) => launchUrl(Uri.parse("https://api.whatsapp.com/send/?phone=+9720588888888&text=שלום"));
  _sendEmail(String copyTex) => launchUrl(Uri.parse("mailto:${'team@bitengos.com'}"));
  _sendPhone(String copyTex) => launchUrl(Uri.parse("tel:${'+9720588888888'}"));

  Widget _getInfoPartChild(String imagePath, String title, String description, Function(String) function) {
    return GestureDetector(
      onTap: () {
        function(description);
      },
      child: Column(
        children: [
          Image(
            image: AssetImage(imagePath),
            height: 100,
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              title,
              style: TextStyle(fontFamily: micSansFontFamily, fontWeight: FontWeight.w900, fontSize: 25),
            ),
          ),
          GestureDetector(
            onTap: () {
              _copyToClipboard(description);
            },
            child: Text(
              description,
              style: TextStyle(
                  fontFamily: davidFontFamily,
                  // fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    ).showCursorOnHover;
  }

  List<Widget> _getInfoPartChildren() {
    return [
      _getInfoPartChild('assets/images/email.png', 'דוא"ל', 'team@bitengos.com', _sendEmail),
      _getInfoPartChild('assets/images/mobile_phone.png', 'טלפון', '076-8888888', _sendPhone),
      _getInfoPartChild('assets/images/whatsapp.png', 'ווצאף', '058-8888888', _sendWhatsapp),
      _getInfoPartChild('assets/images/location.png', 'מיקום', 'מרכז סדאב, חולון', _copyToClipboard),
    ];
  }

  Widget _getInputTopPartChild(String hint, TextDirection textDirection, int relevantFieldPosition) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: screenSizeType == SCREEN_SIZE_DESKTOP ? setGetScreenWidth(context) / 3 - 30 : setGetScreenWidth(context) - 40,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: blueColor, width: 2),
      ),
      child: _getTextField(hint, 1, EdgeInsets.only(left: 10, right: 10), textDirection, relevantFieldPosition),
    );
  }

  List<Widget> _getInputTopPartChildren() {
    return [
      _getInputTopPartChild('שם', TextDirection.rtl, 0),
      _getInputTopPartChild('דוא"ל', TextDirection.ltr, 1),
      _getInputTopPartChild('נושא', TextDirection.rtl, 2),
    ];
  }

  void _setRelevantValue(int relevantFieldPosition, String value) {
    switch (relevantFieldPosition) {
      case 0:
        _name = value;
        break;
      case 1:
        _email = value;
        break;
      case 2:
        _subject = value;
        break;
      case 3:
        _description = value;
        break;
    }
  }

  String _getRelevantError(int relevantFieldPosition) {
    var cantBeEmpty = 'לא יכול להיות ריק';
    var emailWrong = 'דוא"ל לא תקין';
    switch (relevantFieldPosition) {
      case 0:
        return _name == null
            ? ''
            : _name == ''
                ? cantBeEmpty
                : '';
      case 1:
        return _email == null
            ? ''
            : !_isEmailValid(_email.trim())
                ? emailWrong
                : '';
      case 2:
        return _subject == null
            ? ''
            : _subject == ''
                ? cantBeEmpty
                : '';
      case 3:
        return _description == null
            ? ''
            : _description == ''
                ? cantBeEmpty
                : '';
      default:
        return '';
    }
  }

  TextEditingController _getRelController(int fieldPosition) {
    switch (fieldPosition) {
      case 0:
        return _controllerName;
      case 1:
        return _controllerEmail;
      case 2:
        return _controllerSubject;
      case 3:
        return _controllerDescription;
      default:
        return _controllerName;
    }
  }

  Widget _getTextField(String text, int maxLines, EdgeInsets edgeInsets, TextDirection textDirection, int fieldPosition) {
    return TextField(
      textDirection: textDirection,
      maxLines: maxLines,
      controller: _getRelController(fieldPosition),
      decoration: InputDecoration(
        errorText: _getRelevantError(fieldPosition),
        hintTextDirection: TextDirection.rtl,
        border: InputBorder.none,
        hintText: text,
        contentPadding: edgeInsets,
      ),
      onChanged: (value) {
        _setRelevantValue(fieldPosition, value);
        setState(() {
          _getRelevantError(fieldPosition);
        });
        log('checkValue -> onChanged() -> value == ' + value);
      },
    );
  }

  Widget _getInfoAreaWidget() {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 20),
      child: screenSizeType == SCREEN_SIZE_DESKTOP
          ? Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _getInfoPartChildren())
          : Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _getInfoPartChildren()),
    );
  }

  Widget _getInputAreaWidget() {
    return Container(
      width: setGetScreenWidth(context),
      color: greyColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30),
            child: screenSizeType == SCREEN_SIZE_DESKTOP
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getInputTopPartChildren())
                : Column(children: _getInputTopPartChildren()),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 250,
            width: setGetScreenWidth(context) - 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: blueColor, width: 2),
            ),
            child: _getTextField('פירוט ההודעה', 7, EdgeInsets.all(20), TextDirection.rtl, 3),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20, bottom: 30, right: 20),
                  alignment: Alignment.centerLeft,
                  child: PressorButton('שלח', ([p0]) => _onTapSendBtn()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _clearAllControllers() {
    _controllerName.clear();
    _controllerEmail.clear();
    _controllerSubject.clear();
    _controllerDescription.clear();
  }

  void _onTapSendBtn() async {
    if (!_isFieldsFilledCorrect()) {
      _showAlertDialog('כדי להמשיך צריך למלא את כל פרטים');
      return;
    }

    log('checkValues -> name $_name; email $_email subject $_subject');
    _showProgressDialog();
    Response resOne =
        await http.get(Uri.parse('https://us-central1-itcm-solution.cloudfunctions.net/sendMail?email=$_email&name=$_name&subject=$_subject&desc=$_description'));
    print(resOne.body);
    closeActiveWidget(context, true);
    _clearAllControllers();
    _showAlertDialog('ההודעה נשלחה');
    setState(() {});
  }

  bool _isFieldsFilledCorrect() {
    return _name != null &&
        _name.isNotEmpty &&
        _email != null &&
        _email.isNotEmpty &&
        _subject != null &&
        _subject.isNotEmpty &&
        _description.isNotEmpty &&
        _description != null &&
        _email != null &&
        _isEmailValid(_email.trim());
  }

  void _showAlertDialog(String msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              msg,
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, true), // passing true
                child: Text('הבנתי'),
              ),
            ],
          );
        }).then((exit) {
      if (exit == null) return;
    });
  }

  void _showProgressDialog() => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 20,
                  ),
                  Text("המתן בבקשה"),
                ],
              ),
            ),
          );
        },
      );

  bool _isEmailValid(String email) => EmailValidator.validate(email);
}
