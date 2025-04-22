import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DaftarPengembalianView extends GetView {
  const DaftarPengembalianView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DaftarPengembalianView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DaftarPengembalianView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
