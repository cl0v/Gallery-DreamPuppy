String extractUuidFromUrl(String url){
  var path = Uri.parse(url).path;
  if(path.contains('-')){
    return url.split('-').last;
  } else {
    return url.split('/').last;
  }
}