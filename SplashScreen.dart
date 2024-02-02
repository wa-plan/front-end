//SplashScreen

import 'package:flutter/material.dart';

void main(){
	runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: Container(
					decoration: BoxDecoration(
						color: Color(0xFF000000),
						),
					child: Column(
						children: [
						//다수의 위젯을 입력하는 children 매개변수
							Image.asset(
								'Domino/logo.png',
							),
						],
					),
				),
			),
		);
	}
}

