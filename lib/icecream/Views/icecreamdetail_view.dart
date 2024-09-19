import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homepractice/icecream/model/icecream_model.dart';

class IcecreamdetailView extends StatelessWidget {
  const IcecreamdetailView({super.key, required this.icecream});

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100 ,
        title: Text(icecream.flavor),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Hero(
                    tag: icecream.image,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage:  CachedNetworkImageProvider(
                         icecream.image,
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text(
                    "\$${icecream.price.toString()}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.green),
                  )
                ],
              ),
              SizedBox(height: 20,),

              Text(icecream.description,style: Theme.of(context).textTheme.bodySmall,),

              SizedBox(height: 20,),

             const Text('Toppings',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),

             SizedBox(
               height: 100,
               child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context,index,){
                 return Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                   child: Chip(label: Text(icecream.toppings[index])),
                 );
               },itemCount: icecream.toppings.length,),
             ),
              SizedBox(height: 20,),

              const Text('Ingredients',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
              SizedBox(height: 20,),
              ListView.builder(shrinkWrap: true,scrollDirection: Axis.vertical,itemBuilder: (context,index,){
                final ing = icecream.ingredients[index];
                return Card(
                  child: ListTile(

                    title: Text(ing.name),
                    subtitle: Text('QTY  - ${ing.quantity}'),
                  ),
                );
              },itemCount: icecream.ingredients.length,),

            ],
          ),
        ),
      ),
    );
  }
}
