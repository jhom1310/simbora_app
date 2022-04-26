import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  _buildMessage(String message, bool isMe, context) {
    return Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 40.0,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              right: 40.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: Get.width * 0.75,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://cdn1.dotesports.com/wp-content/uploads/sites/3/2021/04/22195558/EzV9bB3VIAUCAQV.jpg'),
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  Container(
                    width: Get.width * 0.5,
                    child: Text(
                      'ALEFF JONATHAN DA SILVA SOARES DE SOUZA',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '18:00',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Container(
                width: Get.width * 0.5,
                child: Text(
                  message,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  List<dynamic> listTest = [
    ['E ai meu bom', true],
    ['olá, rapaziada', true],
    ['kkkkkk', false],
    ['vai da bom', true],
    ['testando heuwhue', false],
    ['kbfdjkbsjdhbfjhsd', true],
    ['dfsdfsd', true],
    ['dfsdfsd', false],
    ['dfsdfsd', true],
    ['dfsdfsd', false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: listTest.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String message = listTest[index][0];
                      final bool isMe = listTest[index][1];
                      return _buildMessage(message, isMe, context);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
