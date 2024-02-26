import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dictionary_api/api/linkApi.dart';
import 'package:dictionary_api/crud/crud.dart';
import 'package:dictionary_api/enum/status.dart';
import 'package:dictionary_api/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

abstract class DictionaryController extends GetxController {
  getData();
  statusListener();
  search();
  playAudio(String url);
}

class DictionaryControllerImp extends DictionaryController {
  late TextEditingController searchWord;
  late Status enumStatus = Crud.status;
  String statusPage = ' ';
  final AudioPlayer player = AudioPlayer();
  List list = [];
  @override
  void onInit() {
    super.onInit();
    searchWord = TextEditingController();
    // ignore: avoid_print
  }

  @override
  statusListener() {
    enumStatus = Crud.status;
    if (enumStatus == Status.notFound) {
      statusPage = 'Page not found 404';
    } else {
      if (enumStatus == Status.toManyReq) {
        statusPage = 'To many request please retry after';
      }
    }
    update();
  }

  @override
  playAudio(String url) async {
    await player.play(UrlSource(url));
  }

  @override
  search() async {
    await getData();
  }

  @override
  getData() async {
    var response =
        await Crud.getRequest('${LinkApi.linkServer}/${searchWord.text}');
    statusListener();
    return response;
  }
}
