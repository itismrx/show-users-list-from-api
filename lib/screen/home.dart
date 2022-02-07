import 'package:flutter/material.dart';
import 'package:rabii/controller/people-controller.dart';
import 'package:rabii/model/people.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<People>>? futurePeople;
  @override
  void initState() {
    super.initState();
    futurePeople = fetchPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            future: futurePeople,
            builder: (context, AsyncSnapshot<List<People?>> snapshot) {
              if (snapshot.hasError) {
                return Text("Something has gone bad!");
              } else if (snapshot.hasData) {
                print('\nsnaphsot.hasData');
                List<People?> people = snapshot.data!;
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  itemBuilder: (context, idx) {
                    return Card(
                      elevation: 1,
                      child: ListTile(
                        trailing: people[idx]!.avater != null
                            ? CircleAvatar(
                                radius: 32,
                                backgroundColor: Colors.black54,
                                // backgroundImage: NetworkImage(people[idx]!.avater!),
                                child: Icon(
                                  Icons.person,
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.black54,
                                child: Icon(
                                  Icons.person,
                                ),
                              ),
                        title: Text(
                          people[idx]!.name!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        subtitle: Text(
                            '${people[idx]!.createdAt!.day}/${people[idx]!.createdAt!.month}/${people[idx]!.createdAt!.year}'),
                        leading: Container(
                          width: 25,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                          child: Text(
                            people[idx]!.id!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: people.length,
                );
              }
              return Center(
                  child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Loading...")
                ],
              ));
            },
          ),
        ));
  }
}
