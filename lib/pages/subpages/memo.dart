import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pencilwith/models/postitmodel.dart';
import 'package:pencilwith/models/todolistmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pencilwith/models/writemodel.dart';
import 'package:pencilwith/pages/subpages/suboptionpages/commonfunction.dart';

class MemoPage extends StatefulWidget {
  @override
  _MemoPageState createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
  //LabeledGlobalKey _containerKey = LabeledGlobalKey('containerKey');
  var containerHeight;
  int _current = 0;
  List modifiedPostItList = [];

  //@override
  void initState() {
    super.initState();
    modifiedPostItList = _makingGridList();

    ///세로 고정
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    ///build가 실행되어 위젯이 그려진 후 해당 함수 실행
    //WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //_getSize();
    //});
  }

  //_getSize() {
  //위젯 key로 RenderBox를 정의한다.
  //RenderBox _viewBox = _containerKey.currentContext.findRenderObject();
  // Offset offset = _viewBox.localToGlobal(Offset.zero);

  //위젯의 좌표를 반환받는다
  // var cdx = offset.dx;
  // var cdy = offset.dy;

  //위젯의 크기를 반환받는다.
  // setState(() {
  //   containerHeight = _viewBox.size.height;
  // });
  //}

  @override
  void dispose() {
    //focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    closedKeyboard(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.red,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  height: 330, //아래쪽에 있는 패딩과 carousel고정 높이 나머지는 변동
                  //key: _containerKey,
                  //color: Colors.yellow,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: CarouselSlider.builder(
                          itemCount: modifiedPostItList.length, //page count
                          options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                              height: 300,
                              autoPlay: false,
                              enlargeCenterPage: true,
                              viewportFraction: 0.8,
                              aspectRatio: 16 / 12,
                              initialPage: 0,
                              enableInfiniteScroll: false),
                          itemBuilder: (context, index, realIndex) => GridView(
                              scrollDirection: Axis.vertical,
                              reverse: false,
                              controller: ScrollController(),
                              physics: ScrollPhysics(),
                              //padding: EdgeInsets.all(0.0),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 16 / 14,
                                // mainAxisSpacing: 5,
                                // crossAxisSpacing: 5,
                                crossAxisCount: 3,
                              ),
                              children: modifiedPostItList[index]
                                  .map<Widget>((e) => Card(
                                        child: Center(
                                          child: Text(
                                            '${e['title']}',
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ))
                                  .toList()),
                        ),
                      ),
                      //Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: modifiedPostItList.map((url) {
                          int index = modifiedPostItList.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Align(
                  child: Text(
                    '    Out Line',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              Divider(),
              Expanded(
                child: Container(
                  //color: Colors.grey[400],
                  child: _getTodoList(),
                ),
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTodoList() {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            subtitle: Text('${todoList[index]['title']}'),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                todoList[index]['isDone'] = value;
              });
            },
            dense: false,
            activeColor: Colors.grey,
            isThreeLine: false,
            selected: todoList[index]['isDone'], //체크여부
            value: todoList[index]['isDone'], //체크박스 값(표시)
            title: !todoList[index]['isDone']
                ? Text('${todoList[index]['content']}')
                : Text(
                    '${todoList[index]['content']}',
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
          );
        });
  }

  List _makingGridList() {
    final int maxGridCount = 9;
    List result = [];
    int pageCount = (postItModel.length / maxGridCount).ceil();
    int index = 0;
    int restrictCount = 0;

    for (int i = 0; i < pageCount; i++) {
      List tmpList = [];
      if (postItModel.length - index + 1 < maxGridCount) {
        restrictCount = (postItModel.length - index);
      } else {
        restrictCount = maxGridCount;
      }
      for (int j = 0; j < restrictCount; j++) {
        tmpList.add(postItModel[index]);
        index++;
      }
      result.add(tmpList);
    }
    return result;
  }
}
