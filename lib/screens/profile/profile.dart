import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(mq),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Rochelle\nCarla',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'M, 25',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 21,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mq.height * 0.03,
                  ),
                  const Text(
                    'About',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.015,
                  ),
                  const Text(
                    'Biotechnology student, who bakes yummy oatmeal cookies in pastime. Loves to hum while cooking. ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.03,
                  ),
                  const Text(
                    'Interests',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.015,
                  ),
                  buildTag('Circket'),
                  SizedBox(
                    height: mq.height * 0.03,
                  ),
                  const Text(
                    'Birthday',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.015,
                  ),
                  const Text(
                    '23 June, 1997',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.03,
                  ),
                  const Text(
                    'Zodiac',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.015,
                  ),
                  const Text(
                    'Gemini',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.03,
                  ),
                  const Text(
                    'Social',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * 0.015,
                  ),
                  SvgPicture.asset('assets/icons/insta.svg',height: 22,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar(Size mq) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: mq.height * 0.1,
              width: mq.width,
              color: Colors.yellow,
            ),
            SizedBox(
              height: mq.height * 0.1,
              width: mq.width,
            ),
          ],
        ),
        Positioned(
          child: const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 36,
            child: CircleAvatar(
              radius: 33,
            ),
          ),
          bottom: mq.height * 0.06,
          right: 1,
          left: 1,
        ),
      ],
    );
  }

  Widget buildTag(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }
}
