/**
 * 
 */
 function toObject(id){
	return  document.getElementById(id)	
}


function checkReg(id, item, regEx, msg){
	if(!regEx.test(toObject(id).value)){
		alert(item + "패턴에 맞지않는다.\n"+msg+"(으)로 작성하셔야 합니다.");
		toObject(id).focus();
		return false;
	}
	return true;
	
}