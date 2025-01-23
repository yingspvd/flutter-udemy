import 'package:flutter/material.dart';
import 'package:flutter_demo/screen/home_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widget/nutrition_fact_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/kfc.png',
                // Replace with your image path
                width: double.infinity,
                height: 254,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Title and Rating
            Text(
              "Wing Zabb",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: 5,
              minRating: 1,
              direction: Axis.horizontal,
              unratedColor: Colors.white,
              allowHalfRating: true,
              ignoreGestures: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print('Rating is: $rating');
              },
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              " มากันที่อีกหนึ่งเมนูกับสูตรอาหาร ไก่ทอด ไก่วิงแซ่บ ชื่อดัง รสชาติเข้มข้น ทำง่าย อร่อยได้ทั้งครอบครัว! เมนูไก่ทอดชื่อดังที่ได้รสชาติไทยๆ พร้อมข้าวคั่วแสนอร่อย เป็นรสชาติไก่ทอดที่คนไทยคุ้นเคยกันเป็นอย่างดี แต่รู้ไหมว่าจริงๆ แล้วไก่วิงแซ่บนั้นมีวิธีทำง่ายแสนง่าย เอามาเป็นไอเดียเมนูปาร์ตี้ปีใหม่ ที่บอกเลยว่ากินเพลินกันทั้งครอบครัวแน่นอน อยากรู้แล้วใช่ไหมละว่าไก่วิงแซ่บมีวิธีทำยังไง ตามมาดูกันเลย!",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 24),

            // Nutrition Facts
            Text(
              "Nutrition facts",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NutritionFactWidget(
                  label: "Cal",
                  value: "320",
                  color: Colors.red[100]!,
                ),
                NutritionFactWidget(
                  label: "PROT",
                  value: "7.1 g",
                  color: Colors.blue[100]!,
                ),
                NutritionFactWidget(
                  label: "CHO",
                  value: "27.2 g",
                  color: Colors.orange[100]!,
                ),
                NutritionFactWidget(
                  label: "HDL",
                  value: "65 mg",
                  color: Colors.green[100]!,
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: const Text("Favorite")))
          ],
        ),
      ),
    );
  }
}
