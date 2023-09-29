import 'package:calendar/core/base/base_state/base_state.dart';
import 'package:calendar/product/component/button/custom_button.dart';
import 'package:calendar/product/component/checkbox/checkbox.dart';
import 'package:flutter/material.dart';

//TODO color, padding vb. özellikler temadan çekilecek.
//TODO checkbox için onpressed fonksiyonu yazılıp ekran ona göre değişecek

class CustomDrawer extends BaseStateless {
  final String? name;
  final String? img;
  final List? filter;
  const CustomDrawer({Key? key, this.name, this.img, this.filter});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [buildImage(), buildName(), buildFilter(), buildButton(context), buildDivider(), buildSettings()],
        ),
      ),
    );
  }

  Divider buildDivider() {
    return const Divider(
      thickness: 2,
      color: Colors.black,
      indent: 0,
      endIndent: 0,
    );
  }

  TextButton buildSettings() {
    return TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.settings,
          color: Colors.black,
        ),
        label: const Text(
          "Ayarlar",
          style: TextStyle(color: Colors.black),
        ));
  }

  Padding buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0) + const EdgeInsets.only(bottom: 15),
      child: CustomButton(onTap: () {
        Navigator.pop(context);
      }),
    );
  }

  Expanded buildFilter() {
    return Expanded(
      child: ListView.builder(
        itemCount: filter?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            horizontalTitleGap: 7,
            leading: CustomCheckbox(
              isChecked: false,
              onChange: (bool isSelected) {},
            ),
            trailing: const Icon(Icons.more_vert),
            title: Text(filter?[index]),
          );
        },
      ),
    );
  }

  Text buildName() {
    return Text(
      name ?? "",
      style: const TextStyle(fontSize: 22), //TODO temadan çekilecek
    );
  }

  Padding buildImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0) + const EdgeInsets.only(bottom: 15.0), //TODO padding değerleri cihaz özelliklerine göre değişecek
      child: Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.amber,
        ),
        child: (img != null)
            ? ClipOval(
                child: Image.network(
                  img!,
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              )
            : null,
      ),
    );
  }
}
