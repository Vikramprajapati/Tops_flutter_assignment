import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  //dummy images
  List<String> imageUri = [
    "https://www.kasandbox.org/programming-images/avatars/spunky-sam.png",
    "https://www.kasandbox.org/programming-images/avatars/spunky-sam-green.png",
        "https://www.kasandbox.org/programming-images/avatars/purple-pi.png",
        "https://www.kasandbox.org/programming-images/avatars/purple-pi-teal.png",
        "https://www.kasandbox.org/programming-images/avatars/purple-pi-pink.png",
        "https://www.kasandbox.org/programming-images/avatars/primosaur-ultimate.png",
        "https://www.kasandbox.org/programming-images/avatars/primosaur-tree.png",
        "https://www.kasandbox.org/programming-images/avatars/primosaur-sapling.png",
        "https://www.kasandbox.org/programming-images/avatars/orange-juice-squid.png",
        "https://www.kasandbox.org/programming-images/avatars/old-spice-man.png",
        "https://www.kasandbox.org/programming-images/avatars/old-spice-man-blue.png",
        "https://www.kasandbox.org/programming-images/avatars/mr-pants.png",
  ];

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      itemCount: imageUri.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Container(

            decoration: BoxDecoration(
              color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),),
            child: Image.network(imageUri[index],fit: BoxFit.cover,),);
      },
    );
  }
}
