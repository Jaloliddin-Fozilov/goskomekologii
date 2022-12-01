class SliderModel {
  String? image;
  String? title;
  String? description;

  // Constructor for variables
  SliderModel({this.title, this.description, this.image});

  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String getImage() {
    return image!;
  }

  String getTitle() {
    return title!;
  }

  String getDescription() {
    return description!;
  }
}

// List created
List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel();

  // Item 1
  sliderModel.setImage("assets/images/intro_first.png");
  sliderModel.setTitle("Онлайн оформление разрешений");
  sliderModel.setDescription(
      "Для начала начисления Кешбека вам необходимо добавить в нашу платежную систему ваши карты еще раз.");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  // Item 2
  sliderModel.setImage("assets/images/intro_second.png");
  sliderModel.setTitle("Онлайн сдача отчетности");
  sliderModel.setDescription(
      "Для начала начисления Кешбека вам необходимо добавить в нашу платежную систему ваши карты еще раз.");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  // Item 3
  sliderModel.setImage("assets/images/intro_thrid.png");
  sliderModel.setTitle("Оформление разрешений друзьям");
  sliderModel.setDescription(
      "Для начала начисления Кешбека вам необходимо добавить в нашу платежную систему ваши карты еще раз.");
  slides.add(sliderModel);

  // Item 4
  sliderModel.setImage("assets/images/intro_fourth.png");
  sliderModel.setTitle("Подача обращений");
  sliderModel.setDescription(
      "Для начала начисления Кешбека вам необходимо добавить в нашу платежную систему ваши карты еще раз.");
  slides.add(sliderModel);

  sliderModel = SliderModel();
  return slides;
}
