import 'dart:async';
import "dart:math" show pi;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'generated/l10n.dart';
import 'save_rezults.dart';
import 'my_catalog.dart';

enum Mach_piEvent{ //Список ивентов
  calculatemachpi,
  calculatemache
}

class Mach_piBlock{
 double _i = 0.0;
 final _inputEventController = StreamController<Mach_piEvent>();
 StreamSink<Mach_piEvent> get inputEventSink => _inputEventController.sink; // sink - вход в поток (Вход - тип event)

 final _outputStateController = StreamController<double>();
 Stream<double> get outputStateSink => _outputStateController.stream; // stream - выход из потока (Выход  - тип state)

 void _calculate(Mach_piEvent event) { // Список того что происходит во время вызова конкретных ивентов
   if (event == Mach_piEvent.calculatemachpi)
     { // Описание ивента
       _i = pi;
       _outputStateController.sink.add(_i);
     }
   if (event == Mach_piEvent.calculatemache)
   { // Описание ивента
     const double e = 2.718281828459045;
     _i = e;
     _outputStateController.sink.add(_i);
   }
 }
 Mach_piBlock(){
   _inputEventController.stream.listen(_calculate); // конструктор который запускает метод calculate при прохождении данных через поток
 }
 void dispoce(){ // Закрытие потоков
   _inputEventController.close();
   _outputStateController.close();
   }
}
