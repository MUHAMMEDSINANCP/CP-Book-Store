import 'package:cp_book_store/common/color_extension.dart';
import 'package:cp_book_store/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';

class HelpUsView extends StatefulWidget {
  const HelpUsView({super.key});

  @override
  State<HelpUsView> createState() => _HelpUsViewState();
}

class _HelpUsViewState extends State<HelpUsView> {
  String? selectedState;
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: TColor.primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Help Up Help You",
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "It seems as this is your first time using our app, please enter your location so we can filter our results and stock accordingly to your local store.",
                style: TextStyle(color: TColor.subTitle, fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "If you choose to skip, you can change your location at any time in your account settings.",
                style: TextStyle(color: TColor.subTitle, fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Your Location 📌'),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                    color: TColor.textbox,
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButton(
                  isExpanded: true,
                  value: selectedState,
                  hint: const Text("State (required)"),
                  underline: Container(),
                  items: [
                    "Andhra Pradesh",
                    "Arunachal Pradesh",
                    "Assam",
                    "Bihar",
                    "Chhattisgarh",
                    "Goa",
                    "Gujarat",
                    "Haryana",
                    "Himachal Pradesh",
                    "Jharkhand",
                    "Karnataka",
                    "Kerala",
                    "Madhya Pradesh",
                    "Maharashtra",
                    "Manipur",
                    "Meghalaya",
                    "Mizoram",
                    "Nagaland",
                    "Odisha",
                    "Punjab",
                    "Rajasthan",
                    "Sikkim",
                    "Tamil Nadu",
                    "Telangana",
                    "Tripura",
                    "Uttar Pradesh",
                    "Uttarakhand",
                    "West Bengal"
                  ].map(
                    (name) {
                      return DropdownMenuItem(
                        value: name,
                        child: Text(name),
                      );
                    },
                  ).toList(),
                  onChanged: (selectVal) {
                    setState(() {
                      selectedState = selectVal;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                    color: TColor.textbox,
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButton(
                  isExpanded: true,
                  value: selectedCity,
                  hint: const Text("City (not required)"),
                  underline: Container(),
                  items: [
                    "Mumbai",
                    "Bangalore",
                    "Kolkata",
                    "Chennai",
                    "Hyderabad",
                    "Pune",
                    "Ahmedabad",
                    "Jaipur",
                    "Lucknow",
                    "Bhopal",
                    "Indore",
                    "Coimbatore",
                    "Kochi",
                    "Surat",
                    "Kanpur",
                    "Nagpur",
                    "Visakhapatnam",
                    "Thane",
                    "Amritsar",
                    "Vadodara",
                    "Ludhiana",
                    "Nashik",
                    "Meerut",
                    "Agra",
                    "Faridabad",
                    "Rajkot",
                    "Varanasi",
                    "Srinagar",
                    "Aurangabad",
                    "Dhanbad",
                    "Allahabad",
                    "Ranchi",
                    "Howrah",
                    "Jabalpur",
                    "Gwalior",
                    "Vijayawada",
                    "Jodhpur",
                    "Madurai",
                    "Raipur",
                    "Kota",
                    "Tiruchirappalli",
                    "Bareilly",
                    "Guwahati",
                    "Gorakhpur",
                    "Hubli-Dharwad",
                    "Bhubaneswar",
                    "Mysore",
                    "Salem"
                  ].map(
                    (name) {
                      return DropdownMenuItem(
                        value: name,
                        child: Text(name),
                      );
                    },
                  ).toList(),
                  onChanged: (selectVal) {
                    setState(() {
                      selectedCity = selectVal;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainTabView(),
                        ),
                      );
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: TColor.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
