// Copyright (C) 1999 by Max A Mazin

function set_cookie (name, cook, time) {
  var cookieDate = new Date();
  cookieDate.setTime (cookieDate.getTime() + (time*60*60*24));
  document.cookie=name+"="+escape(cook)+"; expires="+cookieDate.toGMTString();
}

function get_cookie (name) {
  var content = document.cookie;
  if (name == "") {
    content = unescape (content);
    return content;
  } else {
    var loc = content.indexOf(name+"=");
    if (loc != -1) {
      loc = loc + 1 + name.length;
      var result = content.substring(loc, content.length);
      loc = result.indexOf (";");
      if (loc == -1) {
        result = result.substring(0, result.length);
      } else {
        result = result.substring(0, loc);
      }
      result = unescape(result);
    } else {
      result = "";
    }
    return result;
  }
}
