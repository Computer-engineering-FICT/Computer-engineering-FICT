var ho_idl=0, ho_ready = false, doc = document;
        
function onContentLoaded(callback) {
  var handler = function() { ho_ready = true; callback(); };
        
  if (doc.addEventListener) {
    doc.addEventListener("DOMContentLoaded", function() { doc.removeEventListener("DOMContentLoaded", arguments.callee, false); handler(); }, false);
  }
  else if (doc.attachEvent) {
    doc.attachEvent("onreadystatechange", function() { if (doc.readyState === "complete" ) { doc.detachEvent("onreadystatechange", arguments.callee); handler(); } });
    if (doc.documentElement.doScroll && window == window.top) (function() {
      if (ho_ready) return;
      try {
        doc.documentElement.doScroll("left");
      }
      catch(error) {
        setTimeout(arguments.callee, 0);
       	return;
      }
      handler();
    })();
  }
  else {
    doc.write(hoadv());
  }
}

function ho_skip () {
  try {
    if (doc.getElementsByTagName('FRAME').length > 0) return true;
    if (window == top) return false;
    var frames = parent.document.getElementsByTagName('FRAME'), maxSize = -1, i, maxN, size;
    if (frames.length == 0) return true;
    for (i=0;i<frames.length;i++) {
      size = (frames[i].offsetWidth || frames[i].contentWindow.innerWidth) * (frames[i].offsetHeight || frames[i].contentWindow.innerHeight);
      if (maxSize < size) {
        maxSize = size;
        maxN = i;
      }
    };
    return parent.window.frames[maxN].document != window.document;
  }
  catch (e) {
    return false;
  }
}

function closeadv() {
  var block = doc.getElementById('ho_adv');
  if (block) block.style.display="none";
}

function hoadv() {
  var _l = '';
  if (lgn) _l = lgn;
  return '<div style="display:block;height:20px;width:100%;position:absolute;top:0;left:0;text-align:right"><div style="float:right"><a href="javascript:closeadv()"><img src="http://www.ho.ua/images/close.gif" title="close" width="16" height="16" border="0" style="padding:3px;"></a></div><div style="float:right;width:468px;position:relative;left:-4px;"><iframe width="468" height="20" frameborder="0" vspace="0" hspace="0" src="http://adv.vlasenko.net/?login=' + _l + '" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="true"><a target="_blank" href="http://www.ho.ua/">Free hosting!</a></iframe></div></div>';
}

onContentLoaded(function() { 
    if (ho_skip()) return;
    if (ho_idl) return;
    ho_idl=1;
    var htmlObj = doc.getElementsByTagName('html')[0];
    var _l = '';
    if (lgn) _l = lgn;
    if (!doc.body) htmlObj.appendChild(doc.createElement('body'));
        
    var body = doc.body,
    block = doc.createElement('div');
            
    block.id = 'ho_adv';
    block.style.display = 'block';
    block.style.height = '20px';
    body.insertBefore(block, body.firstChild);
    block.innerHTML = hoadv();
});

