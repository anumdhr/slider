import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:slideableanu/models.dart';

enum Actions { share, delete, archieve }

class SlidableWidget extends StatefulWidget {
  const SlidableWidget({super.key});

  @override
  State<SlidableWidget> createState() => _SlidableWidgetState();
}



class _SlidableWidgetState extends State<SlidableWidget> {
  void onDismissed(int index, Actions action) {

    setState(() {
      userModel.removeAt(index);
    });


  }@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Slidable"),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: userModel.length,
        itemBuilder: (context, index) {

          return Slidable(
            startActionPane: ActionPane(motion: StretchMotion(), children: [
              SlidableAction(
                backgroundColor: Colors.greenAccent,
                icon: Icons.share,
                label: "Share",
                onPressed: (context) {
                  onDismissed(
                    index,
                    Actions.share,
                  );
                },
              ),
              SlidableAction(
                backgroundColor: Colors.purpleAccent,
                icon: Icons.archive,
                label: "Archieve",
                onPressed: (context) {


                  onDismissed(
                    index,
                    Actions.archieve,
                  );
                },
              ),
            ]),
            endActionPane: ActionPane(motion: BehindMotion(), children: [
              SlidableAction(
                backgroundColor: Colors.black12,
                icon: Icons.delete,
                label: "Delete",
                onPressed: (context) {
                  onDismissed(index,Actions.delete);
                },
              ),
            ]),
            child: Container(

              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Text(userModel[index].name),
                  Text(userModel[index].email),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
