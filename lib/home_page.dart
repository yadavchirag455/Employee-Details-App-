import 'package:employee_details/services.dart';
import 'package:employee_details/userdetails_screen.dart';
import 'package:flutter/material.dart';
import 'models.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DummyUser? dummyUser;
  bool isloading = true;

  @override
  void initState() {
    userDateApi();
    super.initState();
  }

  userDateApi() async {
    dummyUser = await userData();
    isloading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee Details',
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
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              itemCount: dummyUser!.users!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('Someone tab on bar ');

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Userdetails(User: dummyUser!.users![index])));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // shadow color
                          spreadRadius: 5, // spread radius
                          blurRadius: 7, // blur radius
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.deepPurpleAccent[100],
                          backgroundImage: NetworkImage(
                              dummyUser!.users![index].image.toString()),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dummyUser!.users![index].firstName.toString() +
                                  ' ' +
                                  dummyUser!.users![index].lastName.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              dummyUser!.users![index].company!.department
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
