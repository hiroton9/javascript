function printMsg() {
        alert("Hello!");
}
function changeMsg( _count ) {
    _count++;
    var _color = "black";
    var _lp_count = _count;
    var _msg = "";

    
    if( _count % 2 == 0 ){
        _color = "red";
    }else if( _count % 11 == 0 ){
        _color = "yellow";
    }else{
        _color = "black";
    }

    document.myform1.mytext1.value = _count + "回 変更しました";

    for(var i=0; i < _lp_count; i++){
        _msg += "<font color='" + _color + "' >" + _count + "回 変更しました </font><BR>";
    }
    document.getElementById("mytag1").innerHTML = _msg;

    return _count;
}
