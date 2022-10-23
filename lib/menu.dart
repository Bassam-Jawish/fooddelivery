import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class menu extends StatefulWidget{
  const menu({super.key});

  @override
  _menuestate createState()=>_menuestate();
}
class _menuestate extends State<menu>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.red[300],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(radius:8,colors: [Colors.red,Colors.yellowAccent]),
          ),
        ),

        title: const Text('Menu',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400)),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment:Alignment.bottomCenter,
              children: [
                const Image(image: NetworkImage('https://i.insider.com/609ee8331b5cea0019c452e2?width=750&format=jpeg&auto=webp'),
                  fit: BoxFit.contain,
                  width: 410,
                ),
                Container(
                  height: 50,
                  width: 410,
                  color: Colors.black.withOpacity(.6),
                  child: const Center(
                    child: Text('Steak',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white70
                      ),
                      textAlign: TextAlign.center,),
                  ),
                )

              ],
            ),
          ],),
        const SizedBox(height: 2,),
        Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment:Alignment.bottomCenter,
              children: [
                const Image(image: NetworkImage('https://tmbidigitalassetsazure.blob.core.windows.net/toh/GoogleImagesPostCard/Hearty-Vegetable-Soup_EXPS_HC17_15651_D01_20_6b.jpg'),
                  fit: BoxFit.cover,
                  width: 410,
                  height: 200,
                ),
                Container(
                  height: 50,
                  width: 410,
                  color: Colors.black.withOpacity(.6),
                  child: const Center(
                    child: Text('Soup',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white70
                      ),
                      textAlign: TextAlign.center,),
                  ),
                )

              ],
            ),
          ],),
        const SizedBox(height: 2,),
        Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment:Alignment.bottomCenter,
              children: [
                const Image(image: NetworkImage('https://media.eggs.ca/assets/RecipeThumbs/_resampled/FillWyIxMjgwIiwiNzIwIl0/chopped-chef-salad.jpg'),
                  fit: BoxFit.contain,
                  width: 410,
                ),
                Container(
                  height: 50,
                  width: 410,
                  color: Colors.black.withOpacity(.6),
                  child: const Center(
                    child: Text('Salad',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white70
                      ),
                      textAlign: TextAlign.center,),
                  ),
                )

              ],
            ),
          ],),
        const SizedBox(height: 2,),
        GestureDetector(
          onTap: (){

          },
          child: Row(crossAxisAlignment: CrossAxisAlignment.start,

            children: [
            Stack(
            alignment:Alignment.bottomCenter,
            children: [
              const Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcTCAGkTGUlkRQ0hoF6CG2LDMLM0IVpUhPMIB7vxHqquVPH4SH91it4uFIVPlLetG_TsM&usqp=CAU'),
                fit: BoxFit.contain,
                width: 410,
              ),
              Container(
                height: 50,
                width: 410,
                color: Colors.black.withOpacity(.6),
                child: const Center(
                  child: Text('Dessert',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70
                    ),
                    textAlign: TextAlign.center,),
                ),
              )

            ],
          ),
          ],),
      ),
      ],),
    )
    );

  }
}