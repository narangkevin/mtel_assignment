import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:my_app/FormPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mtel Assignment'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 750.0,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 150.0,
                      width: double.infinity,
                      child: Carousel(
                        dotSize: 4.0,
                        dotSpacing: 15.0,
                        dotColor: Colors.amber,
                        indicatorBgPadding: 2.0,
                        dotBgColor: Colors.transparent,
                        autoplay: false,
                        images: [
                          InkWell(
                            child: Image.asset(
                              'assets/img1.jpg',
                              fit: BoxFit.cover,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FormPage(
                                    imgAddress: 'assets/img1.jpg',
                                  ),
                                ),
                              );
                            },
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FormPage(
                                      imgAddress: 'assets/img2.jpg'),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/img2.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FormPage(
                                      imgAddress: 'assets/img3.jpg'),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/img3.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shadowColor: Colors.grey,
                            child: ListTile(
                              title: Text('$index'),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
