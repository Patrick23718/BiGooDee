import 'package:bigoodee/constants.dart';
import 'package:bigoodee/views/reset_pass_screen.dart';
import 'package:flutter/material.dart';

class FogotPassScreen extends StatefulWidget {
  const FogotPassScreen({Key? key}) : super(key: key);

  @override
  _FogotPassScreenState createState() => _FogotPassScreenState();
}

class _FogotPassScreenState extends State<FogotPassScreen> {
  late FocusNode FNMail, FNPass, FNPassCon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FNMail = FocusNode();
    FNPass = FocusNode();
    FNPassCon = FocusNode();
  }

  @override
  void dispose() {
    FNMail.dispose();
    FNPass.dispose();
    FNPassCon.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _requestFocusMail() {
    setState(() {
      FocusScope.of(context).requestFocus(FNMail);
    });
  }

  void _requestFocusPass() {
    setState(() {
      FocusScope.of(context).requestFocus(FNPass);
    });
  }

  void _requestFocusPassCon() {
    setState(() {
      FocusScope.of(context).requestFocus(FNPassCon);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _secureText = true;
  bool _secureTextCon = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              centerTitle: true,
              title: Text(
                'Reinitialisation de mot de passe',
                style: headingStyle,
              ),
              leading: SizedBox(
                width: 0,
              ),
              backgroundColor: Colors.transparent,
              bottomOpacity: 0,
              elevation: 0,
            ),
            body: SingleChildScrollView(
                // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Rentres ton email, et tu recevras un lien pour réinitialiser ton mot de passe",
                            style: subHeadingStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 60),
                          Form(
                              key: _formKey,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextFormField(
                                      focusNode: FNMail,
                                      onTap: _requestFocusMail,
                                      cursorColor: kTextColor,
                                      style: TextStyle(
                                        color: kTextColor,
                                      ),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: kPrimaryColor,
                                                  width: 1.0)),
                                          labelText: 'email',
                                          hintText: 'exemple@domaine.com',
                                          labelStyle: TextStyle(
                                              color: FNMail.hasFocus
                                                  ? kPrimaryColor
                                                  : kTextOnlyColor //FocusScope.of(context).hasFocus ? kPrimaryColor : kTextOnlyColor
                                              ),
                                          hintStyle: TextStyle(
                                            fontSize: textRegularP1,
                                            color: kTextOnlyColor,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Material(
                                              color: kPrimaryColor,
                                              elevation: 2.0,
                                              shadowColor: kPrimaryColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              child: Icon(Icons.alternate_email,
                                                  size: 20,
                                                  color: kSecondaryColor),
                                            ),
                                          ),
                                          suffixIconConstraints: BoxConstraints(
                                              minHeight: 35, minWidth: 45)
                                          //child: Icon(Icons.alternate_email, size: 24, color: kSecondaryColor),

                                          ),
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez renseigner votre email';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: SizedBox(
                                        // height: 50,
                                        width: double.infinity,
                                        child: FlatButton(
                                          child: Text(
                                            'Reinitialiser le mot de passe'
                                                .toUpperCase(),
                                            style: TextStyle(
                                                color: kSecondaryColor,
                                                fontSize: 14),
                                          ),
                                          color: kPrimaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          onPressed: () {
                                            // Validate will return true if the form is valid, or false if
                                            // the form is invalid.
                                            if (_formKey.currentState!
                                                .validate()) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ReinitPasswordScreen()));
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ]))
                        ])))));
  }
}
