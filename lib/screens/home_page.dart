import 'package:apiweatherapp/assets.dart';
import 'package:apiweatherapp/utils/apptext.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, -0.9),
              child: Image(image: AssetImage(sun), height: 200),
            )
          ],
        ),
      ),
    );
  }
}
