import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

const  MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItem = <MenuItem>[
  MenuItem(
    title: 'Botones', 
    subTitle: 'Varios botones en Fluter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined),
  MenuItem(
    title: 'Tarjetas', 
    subTitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card),
    MenuItem(
    title: 'ProgressIndicator', 
    subTitle: 'Generales y Controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded),  
  MenuItem(
    title: 'Snackbars y dialogos', 
    subTitle: 'Indicadores en Pantalla', 
    link: '/snackbars', 
    icon: Icons.info_outline),  

  MenuItem(
    title: 'Animated Container', 
    subTitle: 'Stateful Widget animado', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_rounded),  
  MenuItem(
    title: 'UI Controls + Titles', 
    subTitle: 'Una serie de controles de flutter', 
    link: '/ui-controls', 
    icon: Icons.car_rental_rounded),   
  MenuItem(
    title: 'Introducción a la aplicación', 
    subTitle: 'Pequeño tutorial introductorio', 
    link: '/tutorial', 
    icon: Icons.accessible_rounded),  
  MenuItem(
    title: 'InfiniteScroll y Pull', 
    subTitle: 'Listas infinitas y pull to refresh', 
    link: '/infinite', 
    icon: Icons.list_alt_rounded),          
];
