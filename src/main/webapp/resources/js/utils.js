function getSeqAsc(sNum, eNum) {
	var sNumber = (sNum < eNum) ? sNum : eNum;
	var eNumber = (sNum < eNum) ? eNum : sNum;
	var seqArr = [];
	
	for(;sNumber <= eNumber; sNumber++) {
		seqArr.push(sNumber);
	}
	
	return seqArr;
}

function getSeqDesc(sNum, eNum) {
	return getSeqAsc(sNum, eNum).sort(function(a, b) {
		return b - a;
	});
}

function getQueryString(obj) {
	var str = [];
	for (var p in obj) {
		if (obj.hasOwnProperty(p)) {
			str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
		}
	}
	return "?" + str.join("&");
}

function getParameterByName(name, url) {
	if(typeof url === "undefined" || url === null || url.trim() === "") {
		url = window.location.href;
	}
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}