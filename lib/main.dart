import 'package:corral_digital/ui/utils/hide_on_scroll.dart';
import 'package:corral_digital/ui/utils/preserving_state.dart';
import 'package:corral_digital/ui/widgets/custom_app_bar.dart';
import 'package:corral_digital/ui/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_number_picker/flutter_number_picker.dart';

// ignore: import_of_legacy_library_into_null_safe
//import 'package:custom_splash/custom_splash.dart';

/*void main() {
  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> op = {1: Home(), 2: Login()};

  runApp(MaterialApp(
    home: CustomSplash(
      imagePath: 'assets/splash_logo.png',
      backGroundColor: Color(0xff074263),
      animationEffect: 'zoom-in',
      logoSize: 200,
      home: Home(),
      customFunction: duringSplash,
      duration: 2500,
      type: CustomSplashType.StaticDuration,
      outputAndHome: op,
    ),
  ));
}*/

void main() => runApp(Home());

////////////////////////
// Start
/////////////////////////
class Start extends StatefulWidget {
  @override
  StartState createState() => new StartState();
}

class StartState extends State<Start> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Color(0xffffffff),
    primary: Color(0xff074263),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      primary: Color(0xffffffff),
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      side: BorderSide(color: Color(0xff074263), width: 1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));

  Widget showLogoApp() {
    return new Hero(
      tag: 'login',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30.0,
          child: Image.asset('assets/logo_app.png'),
        ),
      ),
    );
  }

  Widget showTitleText() {
    return new CustomText(
      text: "Te damos la bienvenida a Corral Digital",
      fontsize: 45.0,
    );
  }

  Widget showDescriptionText() {
    return new Text(
      'Gestionar tu rancho nunca ha sido ¡tan fácil!',
      textAlign: TextAlign.center,
      style: new TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.w300,
          color: Color(0xff074263)),
    );
  }

  Widget showLoginButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(10.0, 45.0, 10.0, 0.0),
        child: SizedBox(
            height: 40.0,
            width: 210.0,
            child: new ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                print("Clicked");
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              },
              child: Text('Ingresar a mi cuenta'),
            )));
  }

  Widget showRegisterButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(10.0, 45.0, 10.0, 0.0),
        child: SizedBox(
            height: 40.0,
            width: 210.0,
            child: new OutlinedButton(
              style: outlineButtonStyle,
              onPressed: () {},
              child: Text(
                'Crear una Cuenta',
                style: new TextStyle(color: Color(0xff074263)),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
        Flexible(
            flex: 2,
            child: SafeArea(
                child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: new ListView(shrinkWrap: true, children: <Widget>[
                      showLogoApp(),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8),
                      ),
                      showTitleText(),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8),
                      ),
                      showDescriptionText(),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8),
                      ),
                      showLoginButton(),
                      showRegisterButton(),
                    ]))))
      ])),
    );
  }
}

////////////////////////
// Login
/////////////////////////
class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  bool _obscureText = true;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Color(0xff074263),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Color(0xffffffff),
    primary: Color(0xff074263),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  Icon _visibilityIcon =
      new Icon(Icons.visibility, size: 20.0, color: Colors.grey[350]);

  void togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText) {
        _visibilityIcon =
            new Icon(Icons.visibility, size: 20.0, color: Colors.grey[350]);
      } else {
        _visibilityIcon =
            new Icon(Icons.visibility_off, size: 20.0, color: Colors.grey[350]);
      }
    });
  }

  Widget showTitleText() {
    return new CustomText(
      text: "¡Hola, otra vez!",
      fontsize: 45.0,
    );
  }

  Widget showDescriptionText() {
    return new CustomText(
      text: "Introduce los datos para entrar a tu cuenta:",
      fontsize: 16.0,
    );
  }

  Widget showPhoneInput() {
    return Visibility(
        visible: true,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
          child: new TextFormField(
            //controller: _controller,
            maxLines: 1,
            keyboardType: TextInputType.phone,
            autofocus: true,
            decoration: new InputDecoration(
                //hintText: 'Número celular',
                labelText: 'Número celular',
                icon: new Icon(
                  Icons.phone,
                  size: 20.0,
                  color: Colors.grey[350],
                )),
            /*validator: (text) {
            if (text!.isEmpty) {
              return "Este campo es requerido";
            } else if (text.length < 10) {
              return "El telefono debe ser de 10 digitos";
            }
            return null;
          },*/
            //onSaved: (value) => _phone = value.trim(),
            maxLength: 10,
          ),
        ));
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        //inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        obscureText: _obscureText,
        autofocus: false,
        decoration: new InputDecoration(
            //hintText: 'Contraseña',
            labelText: 'Contraseña',
            suffixIcon: IconButton(
                icon: _visibilityIcon,
                onPressed: () {
                  togglePassword();
                }),
            icon: new Icon(
              Icons.lock,
              size: 20.0,
              color: Colors.grey[350],
            )),
        /*validator: (text) {
          if (text.isEmpty) {
            return "Este campo es requerido";
          } else if (text.length < 6) {
            return "La constraseña es de 6 digitos";
          }
          return null;
        },*/
        //onSaved: (value) => _password = value.trim(),
        maxLength: 6,
      ),
    );
  }

  Widget showRecoveryPasswordButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: SizedBox(
            height: 40.0,
            width: 170.0,
            child: new TextButton(
              style: flatButtonStyle,
              onPressed: () {},
              child: Text('Recuperar contraseña'),
            )));
  }

  Widget showLoginButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
        child: SizedBox(
            height: 40.0,
            width: 140.0,
            child: new ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {},
              child: Text('Entrar'),
            )));
  }

  Widget showNewAccountText() {
    return new CustomText(
      text: "¿No tienes una cuenta?",
      fontsize: 16.0,
    );
  }

  Widget showRegisterButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: SizedBox(
            height: 40.0,
            width: 170.0,
            child: new TextButton(
              style: flatButtonStyle,
              onPressed: () {},
              child: Text('¡Regístrate!',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff074263))),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/logo_app.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomLeft)),
            child: Scaffold(
              //backgroundColor: Colors.transparent,
              appBar: CustomAppBar(),
              body: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Flexible(
                        flex: 2,
                        child: SafeArea(
                            child: FractionallySizedBox(
                                widthFactor: 0.9,
                                child: new ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      showTitleText(),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, bottom: 8),
                                      ),
                                      showDescriptionText(),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, bottom: 8),
                                      ),
                                      showPhoneInput(),
                                      showPasswordInput(),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            showRecoveryPasswordButton(),
                                            showLoginButton(),
                                          ]),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, bottom: 8),
                                      ),
                                      showNewAccountText(),
                                      showRegisterButton()
                                    ]))))
                  ])),
            )));
  }
}

////////////////////////
// SingUp
/////////////////////////
class SingUp extends StatefulWidget {
  @override
  SingUpState createState() => new SingUpState();
}

class SingUpState extends State<SingUp> {
  bool _obscureText = true;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Color(0xff074263),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Color(0xffffffff),
    primary: Color(0xff074263),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  Icon _visibilityIcon =
      new Icon(Icons.visibility, size: 20.0, color: Colors.grey[350]);

  void togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText) {
        _visibilityIcon =
            new Icon(Icons.visibility, size: 20.0, color: Colors.grey[350]);
      } else {
        _visibilityIcon =
            new Icon(Icons.visibility_off, size: 20.0, color: Colors.grey[350]);
      }
    });
  }

  Widget showTitleText() {
    return new CustomText(
      text: "Nuevo registro",
      fontsize: 45.0,
    );
  }

  Widget showDescriptionText() {
    return new CustomText(
      text: "Introduce los datos para crear tu cuenta de Corral Digital:",
      fontsize: 16.0,
    );
  }

  Widget showNameInput() {
    return Visibility(
        visible: true,
        child: SizedBox(
            width: 140.0,
            child: new Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
              child: new TextFormField(
                  //controller: _controller,
                  maxLines: 1,
                  //keyboardType: TextInputType.text,
                  autofocus: true,
                  decoration: new InputDecoration(
                    //hintText: 'Nombre',
                    labelText: 'Nombre',
                    labelStyle: new TextStyle(color: Color(0xff074263)),
                    fillColor: Color(0xff074263),
                    /*focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff074263), width: 1.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),*/
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff074263)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff074263)),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff074263)),
                    ),
                  )
                  /*validator: (text) {
            if (text!.isEmpty) {
              return "Este campo es requerido";
            } else if (text.length < 10) {
              return "El telefono debe ser de 10 digitos";
            }
            return null;
          },*/
                  //onSaved: (value) => _phone = value.trim(),
                  ),
            )));
  }

  Widget showLastNameInput() {
    return Visibility(
        visible: true,
        child: SizedBox(
            width: 140.0,
            child: new Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
              child: new TextFormField(
                  //controller: _controller,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  decoration: new InputDecoration(
                    //hintText: 'Apellido',
                    labelText: 'Apellido',
                    fillColor: Color(0xff074263),
                  )
                  /*validator: (text) {
            if (text!.isEmpty) {
              return "Este campo es requerido";
            } else if (text.length < 10) {
              return "El telefono debe ser de 10 digitos";
            }
            return null;
          },*/
                  //onSaved: (value) => _phone = value.trim(),
                  ),
            )));
  }

  Widget showPhoneInput() {
    return Visibility(
        visible: true,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
          child: new TextFormField(
            //controller: _controller,
            maxLines: 1,
            keyboardType: TextInputType.phone,
            autofocus: true,
            decoration: new InputDecoration(
                //hintText: 'Número celular',
                labelText: 'Número celular',
                icon: new Icon(
                  Icons.phone,
                  size: 20.0,
                  color: Colors.grey[350],
                )),
            /*validator: (text) {
            if (text!.isEmpty) {
              return "Este campo es requerido";
            } else if (text.length < 10) {
              return "El telefono debe ser de 10 digitos";
            }
            return null;
          },*/
            //onSaved: (value) => _phone = value.trim(),
            maxLength: 10,
          ),
        ));
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        //inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        obscureText: _obscureText,
        autofocus: false,
        decoration: new InputDecoration(
            //hintText: 'Contraseña',
            labelText: 'Contraseña',
            suffixIcon: IconButton(
                icon: _visibilityIcon,
                onPressed: () {
                  togglePassword();
                }),
            icon: new Icon(
              Icons.lock,
              size: 20.0,
              color: Colors.grey[350],
            )),
        /*validator: (text) {
          if (text.isEmpty) {
            return "Este campo es requerido";
          } else if (text.length < 6) {
            return "La constraseña es de 6 digitos";
          }
          return null;
        },*/
        //onSaved: (value) => _password = value.trim(),
        maxLength: 6,
      ),
    );
  }

  Widget showPassworConfirmdInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        //inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        obscureText: _obscureText,
        autofocus: false,
        decoration: new InputDecoration(
            //hintText: 'Contraseña',
            labelText: 'Confirmar contraseña',
            suffixIcon: IconButton(
                icon: _visibilityIcon,
                onPressed: () {
                  togglePassword();
                }),
            icon: new Icon(
              Icons.lock,
              size: 20.0,
              color: Colors.grey[350],
            )),
        /*validator: (text) {
          if (text.isEmpty) {
            return "Este campo es requerido";
          } else if (text.length < 6) {
            return "La constraseña es de 6 digitos";
          }
          return null;
        },*/
        //onSaved: (value) => _password = value.trim(),
        maxLength: 6,
      ),
    );
  }

  Widget showToggleButtons() {
    List<bool> isSelected = [true, false];
    List<IconData> iconList = [Icons.bluetooth, Icons.wifi];
    return new ToggleButtons(
      children: <Widget>[
        Icon(iconList[0]),
        Icon(iconList[1]),
      ],
      onPressed: (int index) {
        setState(() {
          for (int buttonIndex = 0;
              buttonIndex < isSelected.length;
              buttonIndex++) {
            if (buttonIndex == index) {
              isSelected[buttonIndex] = true;
            } else {
              isSelected[buttonIndex] = false;
            }
          }
        });
      },
      isSelected: isSelected,
    );
  }

  Widget showNumberText() {
    return new CustomText(
      text: "Número de ranchos",
      fontsize: 14.0,
    );
  }

  Widget showNumberPicker() {
    return SizedBox(
        height: 60.0,
        width: 90.0,
        child: new CustomNumberPicker(
          initialValue: 1,
          maxValue: 10,
          minValue: 1,
          step: 1,
          onValue: (value) {
            print(value.toString());
          },
        ));
  }

  Widget showInfoRanchText() {
    return new CustomText(
      text: "Información del Rancho #",
      fontsize: 16.0,
    );
  }

  Widget showRanchNameInput() {
    return Visibility(
        visible: true,
        child: SizedBox(
            width: 140.0,
            child: new Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
              child: new TextFormField(
                  //controller: _controller,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  decoration: new InputDecoration(
                    //hintText: 'Apellido',
                    labelText: 'Nombre del Rancho',
                    fillColor: Color(0xff074263),
                  )
                  /*validator: (text) {
            if (text!.isEmpty) {
              return "Este campo es requerido";
            } else if (text.length < 10) {
              return "El telefono debe ser de 10 digitos";
            }
            return null;
          },*/
                  //onSaved: (value) => _phone = value.trim(),
                  ),
            )));
  }

  Widget showRanchLocationInput() {
    return Visibility(
        visible: true,
        child: SizedBox(
            width: 140.0,
            child: new Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
              child: new TextFormField(
                  //controller: _controller,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  decoration: new InputDecoration(
                    //hintText: 'Apellido',
                    labelText: 'Ubicación del Rancho',
                    fillColor: Color(0xff074263),
                  )
                  /*validator: (text) {
            if (text!.isEmpty) {
              return "Este campo es requerido";
            } else if (text.length < 10) {
              return "El telefono debe ser de 10 digitos";
            }
            return null;
          },*/
                  //onSaved: (value) => _phone = value.trim(),
                  ),
            )));
  }

  Widget showNumberCattleInput() {
    return Visibility(
        visible: true,
        child: SizedBox(
            width: 140.0,
            child: new Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 10.0, 0.0),
              child: new TextFormField(
                  //controller: _controller,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: new InputDecoration(
                    //hintText: 'Apellido',
                    labelText: 'Cantidad de ganado',
                    fillColor: Color(0xff074263),
                  )
                  /*validator: (text) {
            if (text!.isEmpty) {
              return "Este campo es requerido";
            } else if (text.length < 10) {
              return "El telefono debe ser de 10 digitos";
            }
            return null;
          },*/
                  //onSaved: (value) => _phone = value.trim(),
                  ),
            )));
  }

  Widget showLoginButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
        child: SizedBox(
            child: new ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () {},
          child: Text('Ingresar a mi cuenta'),
        )));
  }

  Widget showRegisterText() {
    return new CustomText(
      text: "¿Ya te habías registrado?",
      fontsize: 14.0,
    );
  }

  Widget showRegisterButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: SizedBox(
            height: 40.0,
            width: 170.0,
            child: new TextButton(
              style: flatButtonStyle,
              onPressed: () {},
              child: Text('Ingresar a mi cuenta',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff074263))),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/logo_app.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomLeft)),
            child: Scaffold(
              //backgroundColor: Colors.transparent,
              appBar: CustomAppBar(),
              body: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    Flexible(
                        flex: 2,
                        child: SafeArea(
                            child: FractionallySizedBox(
                                widthFactor: 0.9,
                                child: new ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      showTitleText(),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, bottom: 8),
                                      ),
                                      showDescriptionText(),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, bottom: 8),
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            showNameInput(),
                                            showLastNameInput(),
                                          ]),
                                      showPhoneInput(),
                                      showPasswordInput(),
                                      showPassworConfirmdInput(),
                                      showToggleButtons(),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            showNumberText(),
                                            showNumberPicker(),
                                          ]),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, bottom: 8),
                                      ),
                                      showInfoRanchText(),
                                      showRanchNameInput(),
                                      showRanchLocationInput(),
                                      showNumberCattleInput(),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, bottom: 8),
                                      ),
                                      showLoginButton(),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16, bottom: 8),
                                      ),
                                      showRegisterText(),
                                      showRegisterButton()
                                    ]))))
                  ])),
            )));
  }
}

////////////////////////
// Home
/////////////////////////
class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: PreservingBottomNavState(),
    );
  }
}
