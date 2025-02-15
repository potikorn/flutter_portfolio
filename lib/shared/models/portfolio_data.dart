class PortfolioData {
  static const name = 'POTIKORN THAMMO';
  static const title = 'MOBILE DEVELOPER';
  static const subtitle = 'LITTLE DEVELOPER, LOVE PROGRAMMING, PASSIONATE IN VIDEO GAMES AND GUITAR VOICE';
  
  static const contact = ContactInfo(
    phone: '+66-65-729-5667',
    email: 'potikornth@gmail.com',
    github: 'https://github.com/potikorn',
    location: 'CNX, Thailand',
  );

  static const overview = '''
I started my career in the Android developer world. Java and Kotlin were my best friends when building Android applications. Then, new opportunities came up - the Blue Bird (Flutter). Cross-platform development has been my interest for over 4 years of experience, and Flutter is right up my alley to build cross-platform apps in an international environment. I have delivered plenty of platforms for German users.

Apart from Flutter, I have experience developing healthcare applications using React Native and helping other collaborative projects with web app development.
''';

  static const skills = [
    'Flutter App Development',
    'React Native',
    'Android Development',
    'Kotlin',
    'Dart',
    'Java',
    'ReactJs',
    'HTML/CSS',
    'Javascript',
    'Typescript',
  ];

  static const workExperience = [
    WorkExperience(
      title: 'Mobile developer',
      company: '20Scoops CNX',
      period: '2020 - 2024',
      responsibilities: [
        'Extensive hands-on experience in developing mobile applications using the Flutter framework, leveraging its',
        'widgets, state management, and UI components.',
        'Strong command over Dart programming language',
        'Expertise in creating cross-platform applications for iOS and Android',
        'Capable of identifying and resolving bugs',
        'Optimize app performance',
        'Use version control systems like Git for efficient collaboration with teams, managing code changes, and',
        'tracking project progress.',
      ],
    ),
    WorkExperience(
      title: 'Android developer',
      company: '20Scoops CNX',
      period: '2017 - 2019',
      responsibilities: [
        'Developed Android applications.',
        'Collaborated with teams to find solutions for clients.',
        'Maintained released Android applications.',
      ],
    ),
  ];

  static const education = Education(
    degree: 'Business information system',
    university: 'Maejo phrae university',
    period: '2012 - 2016',
  );

  static const languages = [
    Language(name: 'Thai', level: 'Native'),
    Language(name: 'English', level: 'Intermediate'),
  ];
}

class ContactInfo {
  final String phone;
  final String email;
  final String github;
  final String location;

  const ContactInfo({
    required this.phone,
    required this.email,
    required this.github,
    required this.location,
  });
}

class WorkExperience {
  final String title;
  final String company;
  final String period;
  final List<String> responsibilities;

  const WorkExperience({
    required this.title,
    required this.company,
    required this.period,
    required this.responsibilities,
  });
}

class Education {
  final String degree;
  final String university;
  final String period;

  const Education({
    required this.degree,
    required this.university,
    required this.period,
  });
}

class Language {
  final String name;
  final String level;

  const Language({
    required this.name,
    required this.level,
  });
}
