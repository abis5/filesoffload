function consoleLog(msg) {
    var enableLogs = true;
    if (enableLogs) if (typeof console !== 'undefined') console.log(msg);
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 47 && charCode < 58 || charCode == 45)
        return true;
    return false;
}


