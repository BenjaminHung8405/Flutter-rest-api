import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/user.dart';
import 'package:flutter_rest_api/services/user_api.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API'),
        centerTitle: true,
      ),
      body: bodyAPI(),
    );
  }

  ListView bodyAPI() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        final firstName = user.name.firstName;
        final lastName = user.name.lastName;
        final title = user.name.title;
        final email = user.email;
        return ListTile(
          leading: CircleAvatar(child: Text('${index+1}')),
          title: Text(user.fullname),
          subtitle: Text(email),
        );
    },);
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}