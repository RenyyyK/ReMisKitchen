import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remi_kitchen/models/http_exception.dart';
import 'package:remi_kitchen/providers/auth.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
              image: AssetImage("images/wallpaper.png"),
              fit: BoxFit.cover
            ),
          ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key? key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void showErrorDialog(String message) {
    showDialog(
      context: context, 
      builder: (ctx) => AlertDialog(
        title: Text('An error occured!'),
        content: Text(message),
        actions: <Widget> [
          FlatButton(
            onPressed: () { 
              Navigator.of(ctx).pop();
            }, 
            child: Text('OK')
          )
        ]
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    
    try {
      if (_authMode == AuthMode.Login) {
        // Log user in      
        await Provider.of<Auth>(context, listen: false).login(_authData['email'], _authData['password']);
      } else {
        // Sign user up
        await Provider.of<Auth>(context, listen: false).signup(_authData['email'], _authData['password']);
      }
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains("EMAIL_EXISTS")) {
        errorMessage = 'This email is already in use!';
      } else if (error.toString().contains("INVALID_EMAIL")) {
        errorMessage = 'This is not a valid email!';
      } else if (error.toString().contains("WEAK_PASSWORD")) {
        errorMessage = 'This password is too weak!';
      } else if (error.toString().contains("EMAIL_NOT_FOUND")) {
        errorMessage = 'Could not find a user with this email!';
      } else if (error.toString().contains("INVALID_PASSWORD")) {
        errorMessage = 'Invalid password!';
      }
      showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Could not authenticate you. Please try again later!';
      showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

//   late FocusNode myFocusNode;

//   @override
//   void initState() {
//     super.initState();

//     myFocusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     // Clean up the focus node when the Form is disposed.
//     myFocusNode.dispose();

//     super.dispose();
//   }

//   void _requestFocus(){
//   setState(() {
//     FocusScope.of(context).requestFocus(myFocusNode);
//   });
// }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      color: _authMode == AuthMode.Signup ? Color(0x9004471C) : Color(0x90b57f50),
      // shadowColor: Color(0x00000000),
      child: Container(
        height: 560,//_authMode == AuthMode.Signup ? 520 : 460,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 520 : 460),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(_authMode == AuthMode.Signup ? "SIGN UP\n" : "LOG IN\n", 
                    style: const TextStyle(
                      fontSize: 50,
                      color: Color(0xffF7F3F3),
                    )
                  ),
                ),
                TextFormField(
                  // focusNode: myFocusNode,
                  // onTap: _requestFocus,
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                    labelStyle: TextStyle(
                      color: Color(0xff080D08),
                    ),
                    filled: true,//myFocusNode.hasFocus? true : false,
                    fillColor: Color(0xffF7F3F3),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF7F3F3)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffF7F3F3), width: 4.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value!;
                  },
                ),
                Text("\n"),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color(0xff080D08),
                    ),
                    filled: true,//myFocusNode.hasFocus? true : false,
                    fillColor: Color(0xffF7F3F3),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffF7F3F3)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffF7F3F3), width: 4.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                ),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    enabled: _authMode == AuthMode.Signup,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                          }
                        : null,
                  ),
                SizedBox(
                  height: 20,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  RaisedButton(
                    child:
                        Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                    onPressed: _submit,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                    color: _authMode == AuthMode.Signup? Color(0x90b57f50) : Color(0x9004471C), 
                    textColor: Theme.of(context).primaryTextTheme.button!.color,
                  ),
                Text("\n"),
                Text(_authMode == AuthMode.Login ? 'Don\'t have an account yet?' : 'Already have an account?'),
                RaisedButton(
                    child: Text(_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'),
                    onPressed: _switchAuthMode,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                    color: _authMode == AuthMode.Signup? Color(0x9004471C) : Color(0x90b57f50), 
                    textColor: Theme.of(context).primaryTextTheme.button!.color,
                  ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
