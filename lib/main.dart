// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyWdget());
}

class MyWdget extends StatefulWidget {
  const MyWdget({super.key});

  @override
  State<MyWdget> createState() => _MyWdgetState();
}

class _MyWdgetState extends State<MyWdget> {
  late PageController _pageController;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _index = index;
            });
          },
          children: [
            _funk1(),
            _funk1(),
            _funk1(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          ],
          currentIndex: _index,
          onTap: (int index) {
            setState(() {
              _index = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add_circle),
        ),
      ),
    );
  }

  _funk1() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 180, 144, 251),
              ),
              padding: EdgeInsets.only(left: 20, top: 35, right: 20),
              height: 320,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.horizontal_split_outlined,
                        color: Colors.white,
                      ),
                      Expanded(child: SizedBox()),
                      Image.asset(
                        "assets/images/photo1.jpg",
                        height: 50,
                        width: 50,
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Let's find",
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "your top doctor!",
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        focusColor: Colors.white,
                        iconColor: Colors.white,
                        prefixIconColor: Colors.grey,
                        hintText: "Search health issue..............",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          children: [
            _funk2("assets/images/all.png", "All"),
            _funk2("assets/images/yurak.png", "Cordiology"),
            _funk2("assets/images/55.png", "Medicine"),
            _funk2("assets/images/44.png", "General"),
          ],
        ),
        _card("assets/images/photo2.jpg", "Dr.Maria Waston",
            "Heart Surgeon, London, England", true),
        _card("assets/images/photo3.jpg", "Dr.Stevi Jessi", "General Dentist",
            false),
      ],
    );
  }

  _funk2(String images, String text) {
    return Column(
      children: [
        Image.asset(
          images,
          height: 50,
          width: 50,
        ),
        SizedBox(height: 2),
        Text(
          text,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }

  _card(String images, String text1, String text2, bool setLokol) {
    return Card(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(16),
      elevation: 6,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        height: 120,
        child: Row(
          children: [
            SizedBox(width: 12),
            Image.asset(
              images,
              height: 70,
              width: 70,
            ),
            SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  text2,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                setLokol
                    ? ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          fixedSize: Size(100, 20),
                        ),
                        child: Text(
                          "Appointment",
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      )
                    : Text(""),
              ],
            )
          ],
        ),
      ),
    );
  }
}
