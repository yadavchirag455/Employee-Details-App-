import 'package:employee_details/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Userdetails extends StatelessWidget {
  Userdetails({super.key, required this.User});

  final Users User;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Full Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
                30), // Adjust the value according to your preference
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                // CachedNetworkImage(
                //   imageUrl: User.image.toString(),
                //   placeholder: (context, url) => CircularProgressIndicator(),
                //   errorWidget: (context, url, error) => Icon(Icons.error),
                // ),

                // CachedNetworkImage(
                //   imageUrl: User.image.toString(),
                //   placeholder: (context, url) => CircularProgressIndicator(),
                //   errorWidget: (context, url, error) => Icon(Icons.error),
                // ),

                CachedNetworkImage(
                  imageUrl: User.image.toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        // colorFilter: const ColorFilter.mode(
                        //   Colors.red,
                        //   BlendMode.colorBurn,
                        // ),
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),

                // CircleAvatar(
                //   radius: 120,
                //   backgroundColor: Colors.deepPurpleAccent[60],
                //   backgroundImage: NetworkImage(User.image.toString()),
                // ),
                Text(
                  User.firstName!.toString() +
                      ' ' +
                      User.maidenName!.toString() +
                      ' ' +
                      User.lastName!.toString(),
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                ),
                detailsRow(Headline: 'Age', value: User.age.toString()),
                detailsRow(Headline: 'Gender', value: User.gender.toString()),
                detailsRow(Headline: 'Email', value: User.email.toString()),
                detailsRow(Headline: 'Phone', value: User.phone.toString()),
                detailsRow(
                    Headline: 'User Name', value: User.username.toString()),
                detailsRow(
                    Headline: 'Password', value: User.password.toString()),
                detailsRow(
                    Headline: 'Blood Group', value: User.bloodGroup.toString()),
                detailsRow(
                    Headline: 'Heights', value: User.height.toString() + ' cm'),
                detailsRow(Headline: 'Weight', value: User.weight.toString()),
                detailsRow(
                    Headline: 'Colour of Eye', value: User.eyeColor.toString()),
                detailsRow(
                    Headline: 'Hair Colour & Type',
                    value: User.hair!.color.toString() +
                        ' & ' +
                        User.hair!.type.toString()),
                detailsRow(Headline: 'Domain', value: User.domain.toString()),
                detailsRow(
                    Headline: 'Your IP Address', value: User.ip.toString()),
                detailsRow(
                    Headline: 'Company Details', value: User.company.toString())
              ],
            ),
          ),
        ),
      ),
    );
  }

  detailsRow({final Headline, final value}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              Headline,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(': ' + value)),
        ],
      ),
    );
  }
}
