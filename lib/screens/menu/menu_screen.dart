import 'package:get/get.dart';
import 'package:flutter/material.dart';

import './chat_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Conversations',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 5),
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                buildConversationListItem(name: 'Broadcast'),
            itemCount: 3,
          ),
        ],
      ),
    );
  }

  Widget buildConversationListItem({String? name}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        onTap: (){
          Get.to(() => Chat(name: name,));
        },
        tileColor: Colors.white,
        leading:  const CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey,
          child: CircleAvatar(
            radius: 18,
          ),
        ),
        title: Text(
          name!,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.5,
            color: Colors.black87,
          ),
        ),
        trailing: const Icon(
          Icons.circle,
          color: Colors.yellow,
          size: 10,
        ),
      ),
    );
  }
}
