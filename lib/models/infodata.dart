class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel();

  //1
  sliderModel.setDesc(
    "Brings together your files, your tools, projects and people including a new mobile and desktop application.",
  );
  sliderModel.setTitle("Search For New Memes!");
  sliderModel.setImageAssetPath("assets/images/info1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
    "Brings together your files, your tools, projects and people including a new mobile and desktop application.",
  );
  sliderModel.setTitle("Get Results According Interest.");
  sliderModel.setImageAssetPath("assets/images/info2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
    "Brings together your files, your tools, projects and people including a new mobile and desktop application.",
  );
  sliderModel.setTitle("Share Memes With Friends.");
  sliderModel.setImageAssetPath("assets/images/info3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  //4

  sliderModel.setDesc(
    "Brings together your files, your tools, projects and people including a new mobile and desktop application.",
  );
  sliderModel.setTitle("Post Your Own Memes.");
  sliderModel.setImageAssetPath("assets/images/info4.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
