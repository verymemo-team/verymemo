import 'package:flutter/material.dart';

class MemoDetailBody extends StatelessWidget {
  const MemoDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'sample_26.png',
      'sample_27.png',
      'sample_28.png',
      'sample_29.png',
      'sample_30.png',
    ];
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
           "Dd",
              style: TextStyle(color: Color(0xffB9B9B9)),
            ),
            SizedBox(
              height: 4,
            ),
            Text("""웹 서핑을 하다보면,
그래픽 디자인이나 타이포그래피 그리고 웹 템플릿 등을 통해 흔히 만나볼 수 있습니다.
하지만 로렘입숨의 의미나 용도를 정확히 알지는 못했는데,
갑자기 궁금하더라구요. 

그래서 한 번 찾아 봤습니다.

로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은
출판이나 그래픽 디자인 분야에서
폰트, 타이포그래피, 레이아웃 같은
그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로,"""),
            SizedBox(
              height: 4,
            ),
            if (imgList.isNotEmpty)
              Column(
                children: imgList.map((url) {
                  return Column(
                    children: [
                      url != ''
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'assets/images/sample/$url',
                                width: MediaQuery.of(context).size.width - 24,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  );
                }).toList(),
              )
          ],
        ),
      ),
    );
  }
}
