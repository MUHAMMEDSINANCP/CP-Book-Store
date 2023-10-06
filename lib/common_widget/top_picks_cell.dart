import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class TopPicksCell extends StatelessWidget {
  final Map iObj;

  const TopPicksCell({super.key, required this.iObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width * 0.33,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black38, offset: Offset(0, 2), blurRadius: 5),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                iObj["img"].toString(),
                width: media.width * 0.33,
                height: media.width * 0.50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            iObj["name"].toString(),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TColor.text,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            iObj["author"].toString(),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TColor.subTitle,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
