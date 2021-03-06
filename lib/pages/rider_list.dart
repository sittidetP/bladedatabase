import 'package:bladedatabase/database/rider_database.dart';
import 'package:bladedatabase/model/rider_data.dart';
import 'package:bladedatabase/pages/rider_detail/rider_detail_page.dart';
import 'package:flutter/material.dart';

class RiderList extends StatefulWidget {
  static const String routeName = "/riderList";
  const RiderList({Key? key}) : super(key: key);

  @override
  _RiderListState createState() => _RiderListState();
}

class _RiderListState extends State<RiderList> {
  List<RiderData> datas = RiderDatabase().datas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/resource/bg4.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: ListView.builder(
            itemCount: datas.length,
            itemBuilder: (BuildContext context, int index) {
              var riderItem = datas[index];

              return Card(
                margin: EdgeInsets.all(8.0),
                elevation: 5.0,
                shadowColor: Colors.black.withOpacity(0.2),
                color: Colors.black.withOpacity(0.5),
                child: InkWell(
                  onTap: () => _handleClickRiderItem(riderItem),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Image.asset(
                            riderItem.defaultImage,
                            height: 80.0,
                            width: 80.0,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        riderItem.icon,
                        SizedBox(width: 10.0,),
                        Text(riderItem.name, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),

                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  _handleClickRiderItem(RiderData riderData) {
    Navigator.pushNamed(
      context,
      RiderDetailPage.routeName,
      arguments: riderData,
    );
  }
}
