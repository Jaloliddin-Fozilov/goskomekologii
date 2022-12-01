import 'package:flutter/material.dart';
import 'package:goskomekologii/main.dart';
import 'package:goskomekologii/models/slider_model.dart';
import 'package:goskomekologii/screens/home_page.dart';
import 'package:goskomekologii/screens/login_screen.dart';
import 'package:goskomekologii/services/contants.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreens(),
    );
  }
}

class IntroScreens extends StatefulWidget {
  @override
  _IntroScreensState createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  List<SliderModel> slides = [];
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void goToHomeLogin() async {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 30),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: goToHomeLogin,
                child: const Text(
                  'Пропустить',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: slides.length,
                  itemBuilder: (context, index) {
                    // contents of slider
                    return Slider(
                      slide: slides[index],
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    slides.length,
                    (index) => buildDot(index, context),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(186, 208, 255, 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    color: APPBARCOLOR,
                    onPressed: () {
                      if (currentIndex == slides.length - 1) {
                        goToHomeLogin();
                      }
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
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
      width: currentIndex == index ? 24 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? APPBARCOLOR : Colors.grey,
      ),
    );
  }
}

class Slider extends StatelessWidget {
  SliderModel? slide;

  Slider({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Image.asset(
            slide!.image!,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 90, bottom: 80),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/images/gradient.png',
                ),
                fit: BoxFit.cover,
              )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Text(
                      slide!.title!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Text(
                      slide!.description!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
