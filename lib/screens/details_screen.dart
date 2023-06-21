import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/widgets/bottom_nav_bar.dart';

import '../widgets/search_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.39,
            decoration: const BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  "assets/images/meditation_bg.png",
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: size.height * 0.02),
                    const Text(
                      "3-10 MIN Course",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.02),
                    SizedBox(width: size.width * 0.6),
                    const Text(
                        "Live happier and healthier by learning \nthe fundamentals of meditation and \nmindfulness"),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(width: size.width * 0.5, child: const SearchBa()),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                     Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        SessionCard(
                          sessionNum: 1,
                            isDone: true,
                          onPress: (){},
                        ),
                        SessionCard(
                          sessionNum: 2,
                          onPress: (){},
                        ),
                        SessionCard(
                          sessionNum: 3,
                          onPress: (){},
                        ),
                        SessionCard(
                          sessionNum: 4,
                          onPress: (){},
                        ),
                        SessionCard(
                          sessionNum: 5,
                          onPress: (){},
                        ),
                        SessionCard(
                          sessionNum: 6,
                          onPress: (){},
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.02,),
                    Text("Meditation", style: Theme.of(context).textTheme.titleLarge,),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(10),
                      height: size.height*0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius:23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ]
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/Meditation_women_small.svg'),
                          SizedBox(width: size.width *0.02,),
                          Expanded(child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Basic 2", style: Theme.of(context).textTheme.titleMedium,),
                              const Text("Start your deepen you practice")
                            ],
                          ),
                          ),
                          Padding(padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icons/Lock.svg"),

                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final VoidCallback onPress;
  const SessionCard({
    super.key,
    required this.sessionNum,
    this.isDone = false, required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
         // padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 17),
                    spreadRadius: -17,
                    blurRadius: 23,
                    color: kShadowColor),
              ]),
          child: Material(
            color: Colors.transparent,

            child: InkWell(
              onTap: onPress,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                          color: isDone ? kBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: kBlueColor)),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      "Session $sessionNum",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
