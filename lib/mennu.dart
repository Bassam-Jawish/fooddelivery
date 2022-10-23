import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fooddelivery/login_page.dart';
import 'package:fooddelivery/pgview_model.dart';
import 'package:marquee/marquee.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _currentPage = 0;
  Timer? _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
        print('$_currentPage');
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
          icon: Icon(Icons.keyboard_backspace),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
                radius: 8, colors: [Colors.red, Colors.yellowAccent]),
          ),
        ),
        title: const Text('Food Delivery App',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
        elevation: 0,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 75, 0, 0),
            child: Text(
              'Paccucci',
              style: TextStyle(fontFamily: 'Pacifico', fontSize: 80),
            ),
          ),
          Expanded(
            child: Marquee(
              text:
                  'Find out more about our menu items today! Your favourites, delivered. Order through Paccucci app,and we"ll bring it to you.',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              scrollAxis: Axis.horizontal,
              blankSpace: 400.0,
              //speed
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: Container(
              width: 445,
              height: 350,
              child: PageView.builder(
                controller: _pageController,
                itemCount: appBannerList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  appBannerList[index].ImageURL),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.6),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    appBannerList[index].title,
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.white70),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Text(
                        appBannerList[index].explain,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                    ],
                  );
                },
              ),
            ),
            /*Container(
              width: double.infinity,
              height: 340,
              color: Colors.red,
              child: Column(
                children: [
                  GestureDetector(
                    onTap:(){},
                    child: SizedBox(
                      height: 250,
                      width: 500,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: appBannerList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    appBannerList[index].ImageURL),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.6),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      appBannerList[index].title,
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white70),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 90,
                    child: PageView.builder(
                      controller: _pageControllert,
                      itemCount: appBannerList.length,
                      itemBuilder: (context, index) {
                        return Text(appBannerList[index].explain,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 20),);
                      },
                    ),
                  ),
                ],
              ),
            ),*/
          ),
        ],
      ),
    );
  }
}
