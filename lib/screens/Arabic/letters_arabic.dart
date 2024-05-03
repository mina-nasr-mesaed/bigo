import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widget/Button.dart';

class letters extends StatefulWidget {


  @override
  State<letters> createState() => _lettersState();
}

class _lettersState extends State<letters> {
  final player = AudioPlayer();

  List <QueryDocumentSnapshot>data =[];
  bool isLoading = true;
  getData()async{
    QuerySnapshot querySnapshot = (await FirebaseFirestore.instance.collection('arabic').doc('GiLAQIGfawqo2nFBBvF0').collection('letters').orderBy('name').get()) as QuerySnapshot<Object?>;
    data.addAll(querySnapshot.docs);
    isLoading =false;
    setState(() {

    });
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: isLoading == true ? Center(child: CircularProgressIndicator()):
      Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 16/20,
              ),
              itemCount: data.length,
              itemBuilder: (context, int i) {
                return Container(
                  child: GestureDetector(
                    onTap: () async {
                      setState(() async{
                        await player.play(UrlSource('${data[i]['voiceUrl']}'));
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.network('${data[i]['imgUrl']}'),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: Offset(3, 3),
                        )
                      ]),
                );
              }),
        ),
      ),
    );
  }
}




  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('assets/voice/arabic/letters/lion.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/2.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/3.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/4.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/5.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/6.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/7.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/8.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/9.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/10.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/11.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/12.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/13.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/14.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/15.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/16.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/17.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/18.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/19.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/20.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/img/letters/21.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/voice/arabic/letters/22.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/voice/arabic/letters/23.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/voice/arabic/letters/24.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/voice/arabic/letters/25.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/voice/arabic/letters/26.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/voice/arabic/letters/27.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: Image.asset('assets/voice/arabic/letters/28.png'),
  // ),
  // ),
  // GestureDetector(
  // onTap: () async {
  // await player.play(AssetSource('true.wav'));
  // Navigator.pushNamed(context, 'model');
  // },
  // child: Padding(
  // padding: const EdgeInsets.all(16.0),
  // child: CustomButton(text: 'جــاهز للاختبار',),
  // ),
  // ),