import 'package:chatbubble/model/receive.dart';
import 'package:chatbubble/model/send.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SendCustomBubble(
              color: Colors.black,
              massage: '',
              strokColor: Colors.yellow,
              strokWidth: 5,
            ),
            SizedBox(
              height: 20,
            ),
            ReceiveCustomBubble(
              message: "",
              color: Colors.green,
              strokColor: Colors.pink,
              strokWidth: 5,
            )
          ],
        ),
      ),
    );
  }
}
