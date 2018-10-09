function validarPropuesta() {
    var correcto = true;
    var titulo = $('#TituloP').val();

    if (titulo.length < 4) {
        $('#error_TituloP').show();
        correcto = false;
    } else
        $('#error_TituloP').hide();
    var lugar = $('#LugarP').val();

    if (lugar.length < 4) {
        $('#error_LugarP').show();
        correcto = false;
    } else {
        $('#error_LugarP').hide();
    }

    var montoT = $('#MontoT').val();
    if (montoT === '') {
        $('#error_MontoT').show();
        correcto = false;
    } else {
        $('#error_MontoT').hide();
    }

    var montoE = $('#MontoE').val();
    if (montoE === '') {
        $('#error_MontoE').show();
        correcto = false;
    } else {
        $('#error_MontoE').hide();
    }

    return correcto;
}
