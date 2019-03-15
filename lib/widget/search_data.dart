import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widget/chat_item.dart';
import '../models/chat_model.dart';

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? dummyData
        : dummyData
            .where((chatModel) =>
                chatModel.name.toLowerCase().contains(query.toLowerCase()) ||
                chatModel.message.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ChatItemWidget(
            chatModelList: suggestionList,
            index: index,
          ),
    );
  }
}
