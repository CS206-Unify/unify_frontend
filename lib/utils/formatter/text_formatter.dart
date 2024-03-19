String shrinkText(String str) {
  return str.length > 15 ? "${str.substring(0, 12)}..." : str;
}
