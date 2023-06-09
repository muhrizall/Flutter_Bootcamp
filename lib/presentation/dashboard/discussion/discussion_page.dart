import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_item_widget.dart';
import 'discussion_controller.dart';
import 'input_chat_widget.dart';

/// C is a generic class can referred to other class based on assignment
/// In this case other engineer can create new controller but must extends
/// from [DiscussionController]. So, you will not double lifecycle execution.
class DiscussionPage<C extends DiscussionController> extends GetView<C> {
  static const routeName = '/discussion';

  DiscussionPage({super.key});

  TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(context),
      body: Column(
        children: [Expanded(child: buildBody(context)), buildBottom(context)],
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Diskusi Soal'),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(10),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingMessages) {
        return buildLoading(context);
      }

      return buildData(context);
    });
  }

  Widget buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }

  Widget buildData(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) {
        final chat = controller.messages[index];
        return ChatItemWidget(chat: chat);
      },
      itemCount: controller.messages.length,
      reverse: true,
    );
  }

  Widget buildBottom(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(0, 0),
          blurRadius: 7,
          spreadRadius: 0,
          color: Colors.black.withOpacity(0.25),
        ),
      ]),
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding, top: bottomPadding),
        child: InputChatWidget(
          onTapAdd: () => onTapAdd(context),
          onTapCamera: () => onTapCamera(context),
          onTapSend: () => onSend(context),
          chatController: chatController,
        ),
      ),
    );
  }

  void onTapCamera(BuildContext context) {
    controller.openCamera();
  }

  void onSend(BuildContext context) {
    final fileName = controller.selectedFile?.name;
    debugPrint(fileName);
    controller.sendMessage(chatController.text);
    controller.update();
    chatController.text = '';
  }

  void onTapAdd(BuildContext context) {
    controller.openGallery();
  }
}
