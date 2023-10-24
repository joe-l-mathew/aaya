import 'dart:io';

import 'package:aaya/functions/get_location.dart';
import 'package:aaya/repository/api_services/auth_services.dart';
import 'package:aaya/repository/api_services/user_service.dart';
import 'package:aaya/screens/widgets/aaya_button_widget.dart';
import 'package:aaya/screens/widgets/aaya_text_field.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class UserOnboardingScreen extends StatefulWidget {
  const UserOnboardingScreen({super.key});

  @override
  State<UserOnboardingScreen> createState() => _UserOnboardingScreenState();
}

class _UserOnboardingScreenState extends State<UserOnboardingScreen> {
  late Position? position;
  @override
  void initState() {
    getPosition();
    super.initState();
  }

  Future<void> getPosition() async {
    position = await getCurrentLocation();
  }

  TextEditingController nameController = TextEditingController();
  bool isValidated = false;
  XFile? profileImage;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Center(
            child: GestureDetector(
                onTap: () async {
                  profileImage =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  if (profileImage != null) {
                    setState(() {});
                  }
                },
                child: Container(
                  width: size.width * 0.4,
                  height: size.width * 0.4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: profileImage != null
                        ? ClipOval(
                            child: Image.file(
                              File(profileImage!.path),
                              width: size.width * 0.4,
                              height: size.width * 0.4,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(
                            Icons.person,
                            size: size.width * 0.2,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                  ),
                )),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.1),
            child: const Row(
              children: [
                Icon(Icons.person_outline),
                Text("Name"),
              ],
            ),
          ),
          const SizedBox(height: 8),
          AayaTextFromField(
              onChanged: (e) {
                isValidated = e.isNotEmpty;
                setState(() {});
              },
              size: size,
              hintText: "Name",
              controller: nameController,
              inputType: TextInputType.name,
              autoFocous: true),
          const SizedBox(
            height: 40,
          ),
          AayaButtonWidget(
              size: size,
              isValidated: isValidated,
              ontap: () async {
                isLoading = true;
                setState(() {});
                bool isUpdateSuccess = await UserService.updateUser(
                    name: nameController.text,
                    position: position!,
                    profilePath:
                        profileImage == null ? null : profileImage!.path);
                if (isUpdateSuccess) {
                  await AuthServices.getUser();
                }
                isLoading = false;
                setState(() {});
              },
              isLoading: isLoading,
              buttonText: "Continue"),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
