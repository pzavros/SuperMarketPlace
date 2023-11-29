  import 'package:flutter/material.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:supermarketplace/styles/mainStyle.dart';

  class Grocery extends StatefulWidget {
    @override
    _GroceryState createState() => _GroceryState();
  }

  class _GroceryState extends State<Grocery> {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    bool isGridView = false; // A boolean to track the user's choice

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product List',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.grid_on_rounded,
                        color: isGridView
                            ? (Theme.of(context).brightness == Brightness.light ? dark1 : light5)
                            : Colors.grey),
                      onPressed: () {
                        setState(() {
                          isGridView = true;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.reorder,
                          color: !isGridView
                              ? (Theme.of(context).brightness == Brightness.light ? dark1 : light5)
                              : Colors.grey,),
                      onPressed: () {
                        setState(() {
                          isGridView = false;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('ProductsList').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Text('No data available');
                }

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    return isGridView ? buildGridView(snapshot) : buildListView(snapshot);
                }
              },
            ),
          ),
        ],
      );
    }


    Widget buildListView(AsyncSnapshot<QuerySnapshot> snapshot) {
      return ListView(
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          return ListTile( textColor: Theme.of(context).brightness == Brightness.light ? dark1 : light5,
            title: Text(data['productName'] ?? 'No name'),
            subtitle: Text(data['description'] ?? 'No description'),
            trailing: Text('\$${data['price'] ?? '0'}'),
          );
        }).toList(),
      );
    }


    Widget buildGridView(AsyncSnapshot<QuerySnapshot> snapshot) {
      return GridView.count(
        crossAxisCount: 3,
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          return Card(
            color: Theme.of(context).brightness == Brightness.light ? light2 : Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data['productName'] ?? 'No name'),
                Text(data['description'] ?? 'No description'),
                Text('\$${data['price'] ?? '0'}'),
              ],
            ),
          );
        }).toList(),
      );
    }
  }
