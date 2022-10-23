import 'package:flutter/material.dart';
import 'package:fooddelivery/mennu.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailadress = TextEditingController();

  var password = TextEditingController();

  var fromkey = GlobalKey<FormState>();

  bool secure = true;

  bool isAnimating = false;

  double _width = 400;

  void moveTo() async {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Menu()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
                radius: 8, colors: [Colors.red, Colors.yellowAccent]),
          ),
        ),
        title: const Text(
          'login to your account',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Menu()));
              },
              child: const Text('Skip  ->',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Paccucci',
            style: TextStyle(fontFamily: 'Pacifico', fontSize: 80),
          ),
          Center(
            child: Form(
              key: fromkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'thise field shouldn\'t be empty';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      cursorRadius: const Radius.circular(100),
                      controller: emailadress,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(fontSize: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              color: Colors.grey), //<-- SEE HERE
                        ),
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Colors.red,
                        ), // icon is 48px widget.
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'thise field shouldn\'t be empty';
                          } else if (value.length < 8) {
                            return 'this Password is too short';
                          } else {
                            return null;
                          }
                        },
                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(fontSize: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                color: Colors.grey), //<-- SEE HERE
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.red,
                          ),
                          // icon is 48px widget.
                          suffixIcon: IconButton(
                            color: Colors.red,
                            icon: Icon(
                              secure ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                secure = !secure;
                              });
                            },
                          ),
                        ),
                        onChanged: (value) {
                          print(value);
                        },
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        cursorRadius: const Radius.circular(10),
                        obscureText: secure,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                      width: _width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: const RadialGradient(
                            radius: 12,
                            colors: [Colors.red, Colors.yellowAccent]),
                      ),
                      onEnd: () {
                        setState(() {
                          isAnimating = true;
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const Menu()),
                            );
                          });
                          Future.delayed(const Duration(seconds: 3), () {
                            isAnimating = false;
                            _width = 400;
                          });
                        });
                      },
                      child: isAnimating
                          ? Loading()
                          : TextButton(
                              onPressed: () {
                                setState(() {
                                  if (fromkey.currentState!.validate()) {
                                    print(emailadress.text);
                                    print(password.text);
                                    _width = 50;
                                  }
                                });
                              },
                              child: const FittedBox(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Text(
                        'if you don\'t have an Email ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'click here',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget Loading() {
  return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ));
}
