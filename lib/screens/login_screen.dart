import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goskomekologii/main.dart';
import 'package:goskomekologii/models/slider_model.dart';
import 'package:goskomekologii/screens/home_page.dart';
import 'package:goskomekologii/services/contants.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreens(),
    );
  }
}

class LoginScreens extends StatefulWidget {
  @override
  _LoginScreensState createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  List<Widget> slides = [
    Container(),
  ];
  int currentIndex = 0;
  late PageController _controller;
  String phoneNumber = '';
  bool numberDone = false;
  String pinCode = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    slides = [
      Container(),
      Container(),
    ];
    void goToHomeLogin() async {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 30),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentIndex == 0
                    ? const SizedBox()
                    : InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex--;
                          });
                          _controller.previousPage(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.bounceIn,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 224, 224, 224),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: APPBARCOLOR,
                          ),
                        ),
                      ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 224, 224, 224),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'RU',
                      style: TextStyle(
                        color: APPBARCOLOR,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Войти',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Номер телефона',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(3),
                        width: double.infinity,
                        child: Stack(
                          children: [
                            TextFormField(
                              textAlign: TextAlign.left,
                              initialValue: phoneNumber,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  phoneNumber = value;
                                  if (phoneNumber.length == 13 &&
                                      phoneNumber.startsWith('+')) {
                                    numberDone = true;
                                  } else {
                                    numberDone = false;
                                  }
                                });
                              },
                              keyboardType: TextInputType.phone,
                              maxLines: 1,
                            ),
                            if (numberDone)
                              const Positioned(
                                top: 0,
                                bottom: 0,
                                right: 10,
                                child: Icon(Icons.done, color: Colors.green),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'SMS-потверждение',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          text: 'Мы выслали код подверждения \nна номер:  ',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          children: [
                            TextSpan(
                              text: phoneNumber,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      PinInputTextField(
                        decoration: UnderlineDecoration(
                          colorBuilder:
                              PinListenColorBuilder(Colors.green, Colors.grey),
                        ),
                        pinLength: 4,
                        onChanged: (value) {
                          pinCode = value;
                          if (pinCode.length == 4) {
                            setState(() {
                              numberDone = true;
                            });
                          } else {
                            setState(() {
                              numberDone = false;
                            });
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Не получили код? ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Переслать заново',
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: numberDone
                        ? () {
                            if (currentIndex == 0) {
                              setState(() {
                                currentIndex++;
                                numberDone = false;
                                FocusManager.instance.primaryFocus?.unfocus();
                              });
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.bounceIn,
                              );
                            } else {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                  (Route<dynamic> route) => false);
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(18, 158, 83, 1),
                    ),
                    child: Text(
                        currentIndex == 0 ? 'Отправить SMS-код' : 'Продолжить'),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    slides.length,
                    (index) => buildDot(index, context),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  // container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? APPBARCOLOR : Colors.grey,
      ),
    );
  }
}
