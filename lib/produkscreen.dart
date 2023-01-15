import 'package:flutter/material.dart';
import 'produkmodel.dart';

class Produkscreen extends StatefulWidget {
  const Produkscreen({Key? key}) : super(key: key);

  @override
  _ProdukscreenState createState() => _ProdukscreenState();
}

class _ProdukscreenState extends State<Produkscreen> {
  late Future<ProdukList> produklist;

  get iconTheme => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    produklist = getProdukList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text("1461900054-Rizal Prambudi-PAGI",
                style: TextStyle(fontSize: 12, color: Colors.black)),
          ],
        ),
        centerTitle: true,
        leading: BackButton(),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<ProdukList>(
        future: produklist,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return ListView.builder(
                  itemCount: snapshot.data!.categories.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                            '${snapshot.data!.categories[index].image}'),
                        title:
                            Text('${snapshot.data!.categories[index].judul}'),
                        trailing: IconButton(
                          icon: Icon(Icons.assignment_outlined),
                          color: Colors.cyan,
                          onPressed: () {
                            onPressedInfo(context, snapshot, index);
                          },
                        ),
                        isThreeLine: false,
                      ),
                    );
                  });
          }
        },
      ),
    );
  }
}

void onPressedInfo(context, snapshot, index) {
  var alertDialog = AlertDialog(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.restaurant_menu),
        SizedBox(width: 10),
        Text('${snapshot.data.categories[index].judul}'),
      ],
    ),
    content: ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Text('${snapshot.data.categories[index].deskripsi}'),
      ],
    ),
    actions: <Widget>[
      RaisedButton(
        child: Text('close', style: TextStyle(color: Colors.white)),
        color: Colors.red,
        onPressed: () {
          Navigator.of(context).pop();
        },
      )
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
