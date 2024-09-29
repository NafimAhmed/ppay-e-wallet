import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p_pay/app/modules/contact/controller/contacts_controller.dart';

// import '../../../util/app_size.dart';
import '../../../widgets/transection_tile.dart';

class ContactsViews extends GetView<ContactController> {
  const ContactsViews({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Contact'),),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Text(
                  'Recent contacts',
                  style: GoogleFonts.roboto(
                    color: const Color(0xFF6B7280),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),


              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const TransectionTile(
                      title: 'Netflix',
                      subtitle: 'Entertainment',
                      amount: '-\$ 10',
                      imageLink: 'https://variety.com/wp-content/uploads/2019/02/netflix-logo-originals.jpg?w=640',
                      amountColor: Colors.red);
                },
              ),


              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: const Text(
                  'All Contacts',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 0.06,
                    letterSpacing: 0.30,
                  ),
                ),
              ),




              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const TransectionTile(
                      title: 'Netflix',
                      subtitle: 'Entertainment',
                      amount: '-\$ 10',
                      imageLink:
                      'https://variety.com/wp-content/uploads/2019/02/netflix-logo-originals.jpg?w=640',
                      amountColor: Colors.red);
                },
              ),








            ],
          ),
        ),
      ),
    );
  }
}
