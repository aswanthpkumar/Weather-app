import 'package:apiweatherapp/assets.dart';
import 'package:apiweatherapp/services/location_provider.dart';
import 'package:apiweatherapp/utils/apptext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    Provider.of<LocationProvider>(context,listen: false).determinePosition();
    super.initState();

  }



  bool _clicked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Container(
        padding:
            const EdgeInsets.only(top: 65, left: 50, right: 20, bottom: 20),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(backgroudimage),
          ),
        ),
        child: Stack(
          children: [
            _clicked == true
                ? Positioned(
                    top: 60,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        const Icon(Icons.location_pin, color: Colors.red),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                                data: 'Dubai',
                                color: Colors.white,
                                fw: FontWeight.w700,
                                size: 18),
                            const SizedBox(width: 5),
                            AppText(
                                data: 'Good Morning',
                                color: Colors.white,
                                fw: FontWeight.w400),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _clicked = !_clicked;
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, -0.7),
              child: Image(
                image: AssetImage(cloudsun),
                height: 250,
                width: 250,
              ),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Container(
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                        data: '21 °C',
                        color: Colors.black,
                        fw: FontWeight.bold,
                        size: 32),
                    AppText(
                        data: 'Snow',
                        color: Colors.black,
                        fw: FontWeight.w600,
                        size: 26),
                    AppText(data: DateTime.now().toString()),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.75),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.4)),
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage(temphigh),
                              height: 75,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                    data: 'Temp Max',
                                    color: Colors.white,
                                    size: 14,
                                    fw: FontWeight.w600),
                                AppText(
                                  data: '21 °C',
                                  color: Colors.white,
                                  fw: FontWeight.w600,
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                              image: AssetImage(templow),
                              height: 75,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                    data: 'Temp MIn',
                                    color: Colors.white,
                                    size: 14,
                                    fw: FontWeight.w600),
                                AppText(
                                  data: '21 °C',
                                  color: Colors.white,
                                  fw: FontWeight.w600,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      indent: 20,
                      endIndent: 40,
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage(temphigh),
                              height: 75,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                    data: 'Temp Max',
                                    color: Colors.white,
                                    size: 14,
                                    fw: FontWeight.w600),
                                AppText(
                                  data: '21 °C',
                                  color: Colors.white,
                                  fw: FontWeight.w600,
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image(
                              image: AssetImage(templow),
                              height: 75,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                    data: 'Temp MIn',
                                    color: Colors.white,
                                    size: 14,
                                    fw: FontWeight.w600),
                                AppText(
                                  data: '21 °C',
                                  color: Colors.white,
                                  fw: FontWeight.w600,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
