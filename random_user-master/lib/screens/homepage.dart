import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/user_item.dart';
import '../providers/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider providerObject = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Users"),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          final resultobjectofProvider = userProvider.userData;

          if (resultobjectofProvider == null) {
            providerObject.fetchUsers();
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: resultobjectofProvider.result.length,
              itemBuilder: (context, index) {
                final user = resultobjectofProvider.result[index];

                return UserItem(
                  name: user["name"]["first"] + user["name"]["last"],
                  email: user["email"],
                  image: user["picture"]["thumbnail"],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          providerObject.fetchUsers();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
