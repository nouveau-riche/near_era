import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final String? name;
  final String? image;

  const Chat({Key? key, this.name, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 21,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 18,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              name!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.04),
        child: Column(
          children: [
            SizedBox(
              height: mq.height * 0.04,
            ),
            buildSenderMessage('Hi!'),
            SizedBox(
              height: mq.height * 0.028,
            ),
            buildOwnMessage('Hi! Where can we meet up?'),
            SizedBox(
              height: mq.height * 0.028,
            ),
            buildSenderMessage(
                'Anywhere in Beirut. Please share your\nlocation.'),
            const Spacer(),
            buildSendMessage(),
            SizedBox(
              height: mq.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSendMessage() {
    return Builder(builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? const Color.fromRGBO(45, 43, 53, 1)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Expanded(
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write a message...',
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
          ],
        ),
      );
    });
  }

  Widget buildSenderMessage(String msg) {
    return Builder(builder: (context) {
      return Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration:  BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2,color: Colors.grey),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                alignment: Alignment.center,
                child: Text(
                  msg,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget buildOwnMessage(String msg) {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration:  BoxDecoration(
                  border: Border.all(width: 2,color: Colors.grey),
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                alignment: Alignment.center,
                child: Text(
                  msg,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
