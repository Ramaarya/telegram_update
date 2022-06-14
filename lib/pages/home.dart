import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import './setting.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telekilogram'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.blueGrey[700],
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey[900],
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey[700],
              width: double.infinity,
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://picsum.photos/id/99/200/300'),
                      radius: 35,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Text(
                      faker.person.name(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      '+62 899 12345678',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(SettingPage.routeName);
              },
              leading: const Icon(
                Icons.settings,
                size: 25,
                color: Colors.white54,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.info_outline_rounded,
                size: 25,
                color: Colors.white54,
              ),
              title: const Text(
                'Telekilogram Features',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Dismissible(
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Confirm Delete'),
                    content:
                        const Text('Are you sure want to delete this item ?'),
                    actions: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('No'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
            key: Key(index.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              padding: const EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 30,
              ),
            ),
            child: ListTile(
              tileColor: Colors.blueGrey[900],
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://picsum.photos/id/${index + 1}/200/300'),
              ),
              title: Text(
                faker.person.name(),
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                faker.lorem.sentence(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white54),
              ),
              trailing: Text(
                faker.date.month(),
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent[300],
        onPressed: () {},
        child: const Icon(Icons.chat_rounded),
      ),
    );
  }
}
