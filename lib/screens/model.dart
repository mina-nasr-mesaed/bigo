import 'package:bigo/model/itemmodel.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class model extends StatefulWidget {
  @override
  State<model> createState() => _modelState();
}

class _modelState extends State<model> {
  var player = AudioPlayer();
   late List<ItemModel> items;
   late List<ItemModel> items2;
  late int score;
  late bool gameover;



  initGame() {
    gameover = false;
    score = 0;
    items = [
      ItemModel(name: 'lion', img: 'assets/img/animals/lion.png', value: 'lion',),
      ItemModel(name: 'panda', img: 'assets/img/animals/panda.png', value: 'panda',),
      ItemModel(name: 'camel', img: 'assets/img/animals/camel.png', value: 'camel',),
      ItemModel(name: 'dog', img: 'assets/img/animals/dog.png', value: 'dog',),
      ItemModel(name: 'cat', img: 'assets/img/animals/cat.png',value: 'cat',),
      ItemModel(name: 'horse',img: 'assets/img/animals/horse.png', value: 'horse',),
      ItemModel(name: 'sheep',img: 'assets/img/animals/sheep.png',value: 'sheep',),
      ItemModel(name: 'hen',img: 'assets/img/animals/hen.png',value: 'hen',),
      ItemModel(name: 'fox',img: 'assets/img/animals/fox.png',value: 'fox',),
      ItemModel(name: 'cow',img: 'assets/img/animals/cow.png',value: 'cow',),
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) gameover = true;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'score : ',
                        style: Theme
                            .of(context)
                            .textTheme
                            .subtitle1,
                      ),
                      TextSpan(
                        text: '$score',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Colors.teal),
                      ),
                    ],
                  ),
                ),
              ),
              if(!gameover)
                Row(
                  children: [
                    Spacer(),
                    Column(
                      children: items.map((item) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          child: Draggable<ItemModel>(
                            data: item,
                            childWhenDragging: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(item.img),
                              radius: 50,
                            ),
                            feedback: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(item.img),
                              radius: 30,
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(item.img),
                              radius: 30,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Spacer(flex: 2),
                    Column(
                      children: items2.map((item) {
                        return DragTarget<ItemModel>(
                          onAccept: (receivedItem) async {
                            if (item.value == receivedItem.value) {
                              setState(() async {
                                items.remove(receivedItem);
                                items2.remove(item);

                              score += 10;
                              item.accepting = false;
                              await player.play(UrlSource('https://firebasestorage.googleapis.com/v0/b/bigo-1af4e.appspot.com/o/voice%2Ftrue.wav?alt=media&token=f89cee91-5004-460a-a78b-d3a96cc383d0'));
                              });
                            } else {
                              setState(() async {
                                score -= 5;
                                item.accepting = false;
                                await player.play(UrlSource('https://firebasestorage.googleapis.com/v0/b/bigo-1af4e.appspot.com/o/voice%2Ffalse.wav?alt=media&token=aeadee22-071d-415e-b57d-d64f094b2b08'));
                              });
                            }
                          },
                          onWillAccept: (recevedItem) {
                            setState(() {
                              item.accepting = true;
                            });
                            return true;
                          },
                          onLeave: (recevedItem) {
                            setState(() {
                              item.accepting = false;
                            });
                          },
                          builder: (context, acceptItem,rejectedItems) =>
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: item.accepting
                                        ? Colors.grey[400] : Colors.grey[200],
                                  ),
                                  alignment: Alignment.center,
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 6.5,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 3,
                                  margin: EdgeInsets.all(8),
                                  child: Text(
                                    item.name,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline6,
                                  )),
                        );
                      }).toList(),
                    ),
                    Spacer(),
                  ],
                ),
              if(gameover)
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('أنتهت اللعبة',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(fontWeight: FontWeight.bold,
                              color: Colors.red),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text (
                          result(),
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/2.png'),
                      ),
                    ],
                  ),
                ),
              if(gameover)Container(height: MediaQuery
                  .of(context)
                  .size
                  .width / 10,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        initGame();
                      });
                    },
                    child: Text(
                      'New Game',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  result() {
    if(score ==100){
       player.play(AssetSource('success.wav'));
      return 'راااائع لقد فزت';
    }else{
     player.play(AssetSource('tryAgain.wav'));
      return 'Play again to get better score';
    }
  }
  }


