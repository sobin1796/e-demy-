import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morph/cousredetail/firstscreen.dart';
import 'package:morph/cousredetail/secondDraw.dart';
import 'package:velocity_x/velocity_x.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white, // Set the background color as needed
              borderRadius: BorderRadius.only(
                topRight: Radius.elliptical(100, 100),
                bottomRight: Radius.zero,
              )),
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.blueGrey,
                child: SizedBox(
                  height: 150,
                  width: 40,
                  child: 'MINDMORPH'
                      .text
                      .white
                      .align(TextAlign.center)
                      .size(18)
                      .bold
                      .make(),
                ),
              ),
              Buildmenuitem(
                text: 'sobin Rai',
                icon: Icons.abc,
                OnClicked: () => selecteditem(context, 0),
              ).box.make(),
              Buildmenuitem(
                text: 'sobin',
                icon: Icons.abc,
                OnClicked: () => selecteditem(context, 0),
              ).box.make(),
              const Divider(
                color: Vx.black,
                thickness: 1,
              ),
            ],
          ),
        ));
  }

  Widget Buildmenuitem(
      {required String text, required IconData icon, VoidCallback? OnClicked}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: OnClicked,
    );
  }
}

void selecteditem(BuildContext context, int i) {
  switch (i) {
    case 0:
      Get.to(() => const firstsdraw());
      break;
    case 1:
      Get.to(() => const SecondDraw());
  }
}
