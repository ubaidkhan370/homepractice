import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homepractice/icecream/model/icecream_model.dart';
import 'package:homepractice/icecream/widgets/icecream_card.dart';

import 'Views/icecreamdetail_view.dart';

class IcecreamView extends StatelessWidget {

  Future<List<Icecream>?> loadIceCreams() async {
    final rawIceCreams = await rootBundle.loadString('assets/icecream.json');
    await Future.delayed(Duration(seconds: 1));
    final iceCreams = iceCreamModelFromJson(rawIceCreams);
    return iceCreams.icecream;
    //print(decodeIcecreams);
  }

  @override
  Widget build(BuildContext context) {
    Icecream? selectedIceCream;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'IceCreams',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'We have somthing yummy for you',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: loadIceCreams(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final iceCreams = snapshot.data;
                      selectedIceCream = iceCreams![0];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height / 2,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final iceCream = iceCreams[index];
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  IcecreamdetailView(
                                                       icecream: iceCream,)));
                                    },
                                    child: IceCreamCard(iceCream: iceCream));
                              },
                              itemCount: iceCreams.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  })
            ],
          ))
        ],
      ),
    );
  }
}

