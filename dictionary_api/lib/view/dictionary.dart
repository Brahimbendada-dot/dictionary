import 'package:dictionary_api/controller/dictionary_controller.dart';
import 'package:dictionary_api/enum/status.dart';
import 'package:dictionary_api/view/widgets/contain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dictionary extends StatelessWidget {
  const Dictionary({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DictionaryControllerImp());
    return Scaffold(
      body: GetBuilder<DictionaryControllerImp>(builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25)),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 15, right: 8),
                  child: TextFormField(
                    controller: controller.searchWord,
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(fontSize: 20),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          size: 35,
                        ),
                        onPressed: () {
                          controller.search();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              controller.enumStatus == Status.success
                  ? FutureBuilder(
                      future: controller.getData(),
                      builder: (BuildContext, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Contain(
                                        onPressed: () {
                                          for (int i = 0; i <= 4; i++) {
                                            if (snapshot.data[0]['phonetics'][i]
                                                    ['audio'] !=
                                                "") {
                                              controller.playAudio(
                                                  snapshot.data[0]['phonetics']
                                                      [i]['audio']);
                                              break;
                                            }
                                          }
                                        },
                                        title: 'Word',
                                        content: snapshot.data[0]['word']),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Contain(
                                    //     onPressed: () {
                                    //       controller.playAudio(snapshot.data[0]
                                    //           ['phonetics'][0]['audio']);
                                    //     },
                                    //     title: 'phonetic',
                                    //     content: snapshot.data[0]['phonetic']),
                                    // const SizedBox(
                                    //   height: 10,
                                    // ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'meaning',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 5),
                                            ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: snapshot
                                                    .data[0]['meanings'].length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 4),
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Text(
                                                              "part of speech : ",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              '${snapshot.data[0]['meanings'][index]['partOfSpeech']}',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        ListView.builder(
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            shrinkWrap: true,
                                                            itemCount: snapshot
                                                                .data[0]
                                                                    ['meanings']
                                                                    [index][
                                                                    'definitions']
                                                                .length,
                                                            itemBuilder:
                                                                (context, i) {
                                                              return Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            8),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      100],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                      'Definition :',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      '${snapshot.data[0]['meanings'][index]['definitions'][i]['definition']}',
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                    const Text(
                                                                      'Example',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      '${snapshot.data[0]['meanings'][index]['definitions'][i]['example']}',
                                                                      style:
                                                                          const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                    const Text(
                                                                      'Synonyms',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .green,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    ListView
                                                                        .builder(
                                                                      physics:
                                                                          NeverScrollableScrollPhysics(),
                                                                      shrinkWrap:
                                                                          true,
                                                                      itemCount: snapshot
                                                                          .data[
                                                                              0]
                                                                              [
                                                                              'meanings']
                                                                              [
                                                                              index]
                                                                              [
                                                                              'synonyms']
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              ind) {
                                                                        return Container(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                '${snapshot.data[0]['meanings'][index]['synonyms'][ind]}',
                                                                                style: const TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 16,
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    const Text(
                                                                      'antonyms',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .red,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    ListView
                                                                        .builder(
                                                                      physics:
                                                                          NeverScrollableScrollPhysics(),
                                                                      shrinkWrap:
                                                                          true,
                                                                      itemCount: snapshot
                                                                          .data[
                                                                              0]
                                                                              [
                                                                              'meanings']
                                                                              [
                                                                              index]
                                                                              [
                                                                              'antonyms']
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              ind) {
                                                                        return Container(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                '${snapshot.data[0]['meanings'][index]['antonyms'][ind]}',
                                                                                style: const TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 16,
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }),
                                                      ],
                                                    ),
                                                  );
                                                })
                                          ]),
                                    )
                                  ],
                                );
                              });
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.grey[300],
                          ),
                        );
                      })
                  : Center(
                      child: Container(
                        child: Text(
                          '${controller.statusPage}',
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
            ],
          ),
        );
      }),
    );
  }
}
