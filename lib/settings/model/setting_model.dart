import 'dart:convert';

class Setting {
  String title;
  bool value;
  Setting({required this.title, required this.value});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"title": title, "value": value};
  }

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
        title: json["title"] as String, value: json["value"] as bool);
  }

  factory Setting.fromJsonString(String jsonString) {
    return Setting.fromJson(json.decode(jsonString) as Map<String, dynamic>);
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  static List<Setting> defaultSettings() {
    return [
      Setting(title: 'Send me marketing emails', value: false),
      Setting(title: 'Enable notifications', value: true),
      Setting(title: 'Remind me to rate this app', value: false),
      Setting(title: 'Background song refresh', value: true),
      Setting(title: 'Recommend me songs based on my location', value: false),
      Setting(title: 'Auto-transition playback to cast devices', value: true),
      Setting(title: 'Find friends from my contact list', value: true)
    ];
  }
}
