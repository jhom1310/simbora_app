import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simbora_app/app/data/model/message_model.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  _buildMessage(MessageRide msg, context) {
    bool isMe = true;
    if (controller.useractive!.id != msg.user.id) isMe = false;
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
                    backgroundImage: NetworkImage(msg.user.avatar),
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  Container(
                    width: Get.width * 0.5,
                    child: Text(
                      msg.user.firstName,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    child: Text(
                      "${msg.createdAt.hour}:${msg.createdAt.minute}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Container(
                width: Get.width * 0.5,
                child: Text(
                  msg.text,
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
            child: TextField(
              controller: controller.ctrlText,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            onPressed: () {
              controller.sendMessageOnPressed();
              controller.ctrlText.clear();
            },
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
                  child: Obx(() => ListView.builder(
                        reverse: true,
                        padding: EdgeInsets.only(top: 15.0),
                        itemCount: controller.listMessages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildMessage(
                              controller.listMessages[index], context);
                        },
                      )),
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
