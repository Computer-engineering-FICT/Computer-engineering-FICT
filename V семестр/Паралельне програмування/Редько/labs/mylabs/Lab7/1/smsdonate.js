function smsDonateInit() {
	smsDonateButton = window.smsDonateButton || 1;
	document.write('<img src="http://donate.smscoin.com/js/smsdonate/buttons/' +
		smsDonateButton + '.gif" alt="Donate" onclick="smsDonatePopup(\'' +
		(window.smsDonateLanguage? window.smsDonateLanguage: '') + '\')" style="cursor: pointer" />');
}

function smsDonatePopup(language) {
	if (!window.smsDonateId) return;
	var lang = (!!language)? '&language=' + language: '';
	var ls = (language == "english")? '_en': '';
	window.open('http://donate.smscoin.com/js/smsdonate/index' + ls +
		'.html?sid=' + smsDonateId + lang,
		'smsdonate_popup', 'height=500,left=' + (screen.width - 700 >> 1) +
		',resizable=yes,scrollbars=yes,top=' + (screen.height - 500 >> 1) +
		',width=700');
}

smsDonateInit();
