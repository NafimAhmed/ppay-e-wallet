




import 'package:flutter/cupertino.dart';

class CardDropdownTile extends StatelessWidget{
  const CardDropdownTile({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network("https://cdn.freebiesupply.com/images/thumbs/2x/visa-card-template-u75.jpg"),
        const Text('card name'),
        const Text("\$ 2142343254")
      ],
    );
  }

}