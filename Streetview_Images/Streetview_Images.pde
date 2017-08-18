String[] images;
String api_key = "YOUR_API_KEY_GOES_HERE"; // Get an API key from Google's API Console: https://code.google.com/apis/console

void setup() {
  images = loadStrings("data.csv");
  for(int i = 0; i < images.length; i++) {
    String[] values = split(images[i], ",");
    String address = values[0];
    String id = values[1];
    PImage img = getSatImage(address, api_key);
    img.save(id + ".jpg");
  }
}

void draw() {
}

PImage getSatImage(String address, String api_key) {
    String url = "https://maps.googleapis.com/maps/api/streetview?size=640x640&location=" + address + "&key=" + api_key + "&junk=.jpg";
    println(url);
    return(loadImage(url));
}