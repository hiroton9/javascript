function printMsg() {
        alert("Hello!");
}
function changeMsg( _count ) {
    _count++;
    document.myform1.mytext1.value = _count + "回 変更しました";
    return _count;
}
