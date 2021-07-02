

import 'package:car_helper/shared/models/car_model.dart';
import 'package:car_helper/shared/models/refueling_model.dart';

// ignore: non_constant_identifier_names
final DUMMY_CARS = [
  CarModel(
    brand: 'Hyundai', 
    model: 'i30', 
    image:  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0tjRb1WP1vOZ-0ePQZa6r-lEKMnHpueeHjw&usqp=CAU',
    refuelings: [
      RefuelingModel(
        date: '21/06/2021', 
        hour: '18:54', 
        odometer: '95287', 
        type: 'Aditivada', 
        price: 5.83, 
        total: 210.58
      ),
      RefuelingModel(
        date: '21/06/2021', 
        hour: '18:54', 
        odometer: '95587', 
        type: 'Aditivada', 
        price: 5.83, 
        total: 210.58
      )
    ]
  ),
  CarModel(
    brand: 'Ford', 
    model: 'Fiesta', 
    image:  'https://imganuncios.mitula.net/ford_fiesta_2012_flex_ford_fiesta_rocam_sedan_1_6_8v_vermelho_20112012_9060123623071659648.jpg',
    refuelings: [
      RefuelingModel(
        date: '21/06/2021', 
        hour: '10:21', 
        odometer: '40921', 
        type: 'Aditivada', 
        price: 5.83, 
        total: 100
      ),
    ]
  ),
];