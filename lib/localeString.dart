import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocalString extends Translations {
  static final varsayilan = Locale("tr", "TR");
  static final diller = [Locale("tr", "TR"), Locale("en", "EN")];
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'ayarlar': 'Settings',
      'hesap': 'Account',
      'şifreyi değiştir': 'Change Password',
      'dil': 'Languange',
      'gizlilik ve güvenlik': 'Privacy and Security',
      'bildirimler': 'Nofications',
      'koyu tema': 'Dark Thema',
      'hesap aktifliği': 'Active Account',
      'çıkış yap': 'Sing Out',
      'dil sec': 'Choose Lanaguange'
    },
    'tr_TR': {
      'ayarlar': 'Ayarlar',
      'hesap': 'Hesap',
      'şifreyi değiştir': 'Şifreyi Değiştir',
      'dil': 'Diller',
      'gizlilik ve güvenlik': 'Gizlilik ve Güvenlik',
      'bildirimler': 'Bildirimler',
      'koyu tema': 'Koyu Tema',
      'hesap aktifliği': 'Hesap Aktifliği',
      'çıkış yap': 'Çıkış Yap',
      'dil sec': 'Dil Seçiniz'
    }
  };
}
