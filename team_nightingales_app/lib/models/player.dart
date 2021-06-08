

class Player {
  final int id, age;
  final String name, surname, nickname, position, image, country;
  Player({
    this.age,
    this.id,
    this.image,
    this.country,
    this.name,
    this.nickname,
    this.position,
    this.surname,
  });
}

List<Player> players = [
  Player(
      id: 1,
      name: 'Амер',
      surname: 'аль-Баркави',
      age: 23,
      image: "assets/images/miraclew.png",
      nickname: 'Miracle-',
      position: 'Мид',
      country: 'Иордания'),
  Player(
      id: 2,
      name: 'Артур',
      surname: 'Бабаев',
      age: 24,
      image: "assets/images/artee.png",
      nickname: 'Arteezy',
      position: 'Керри',
      country: 'Узбекистан'),
  Player(
      id: 3,
      name: 'Густав',
      surname: 'Магнуссон',
      age: 29,
      image: "assets/images/s4.png",
      nickname: 's4',
      position: 'Хардлейн',
      country: 'Швеция'),
  Player(
      id: 4,
      name: 'Марун',
      surname: 'Мерхей',
      age: 25,
      image: "assets/images/gh.png",
      nickname: 'Gh',
      position: 'Оффлейн',
      country: 'Ливан'),
  Player(
      id: 5,
      name: 'Куро',
      surname: 'Салехи Тахасоми',
      age: 28,
      image: "assets/images/kuroky.png",
      nickname: 'KuroKy',
      position: 'Саппорт',
      country: 'Германия'),
];
