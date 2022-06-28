import 'package:flutter/material.dart';
import 'package:web_device/phone_frame.dart';
import 'package:web_device/simple_button_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DeviceType model = DeviceType.ios;
  double widthPhone = 350;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                child: PhoneFrame(
                    model: model,
                    phoneWidth: widthPhone,
                    background: const Color(0XFF3729A0),
                    child: Scaffold(
                        backgroundColor: const Color(0XFF3729A0),
                        body: Column(
                          children: [
                            Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                color: Color(0XFF3729A0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      width: 36,
                                    ),
                                    SizedBox(
                                        width: 170,
                                        child:
                                            Image.asset('assets/logo_app.png')),
                                    ClipOval(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          splashColor:
                                              Colors.white.withOpacity(0.5),
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.menu,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(
                              child: Container(
                                color: Colors.grey[200],
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(24 / 1.5),
                                      margin: const EdgeInsets.all(24 / 2),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            'https://images.unsplash.com/photo-1564497330053-fe82b14849e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2531&q=80',
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 24),
                                            child: Text(
                                              'History',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Text(
                                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 24 / 2, vertical: 24),
                                      child: SimpleButtonWidget(
                                        radius: 5,
                                        onTap: () {},
                                        mode: SimpleButtonColorMode.FILL,
                                        primary: const Color(0XFF7BC069),
                                        text: 'Start quiz',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ))),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Slider(
                      value: widthPhone,
                      max: 380,
                      min: 350,
                      label: widthPhone.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          widthPhone = value;
                        });
                      },
                    ),
                    TextField(onSubmitted: (value) {
                      widthPhone = double.parse(value);
                      setState(() {});
                    }),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          model = DeviceType.ios;
                          setState(() {});
                        },
                        child: const Text('IOS')),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          model = DeviceType.android;
                          setState(() {});
                        },
                        child: const Text('Android'))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
