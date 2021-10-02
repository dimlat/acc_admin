import 'package:flutter/material.dart';
import 'package:get/get.dart';

onLoading({title = "Loading..."}) => Get.defaultDialog(
    title: title,
    content: const CircularProgressIndicator(),
    barrierDismissible: false);

get unLoading => Get.back();
