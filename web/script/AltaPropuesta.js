function validarPropuesta()
{
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
    } else
        $('#error_LugarP').hide();

    var montoT = $('#MontoT').val();
    if (parsefloat(montoT) > 10000) {
        $('#error_MontoT').show();
        correcto = false;
    } else
        $('#error_MontoT').hide();

    var montoE = $('#MontoE').val();
    if (montoE > (parseFloat(montoT) / 10)) {
        $('#error_MontoE').show();
        correcto = false;
    } else
        $('#error_MontoE').hide();

    var fechaR = new Date($('#FechaR').val());
    var hoy = new Date();
    var dia = hoy.getDay();
    var mes = hoy.getMonth() + 1;
    var anio = hoy.getFullYear();
    var fechaActual = dia + '/' + mes + '/' + anio;
    var fechaR2 = new Date(fechaActual);

    if (fechaR.getTime() < fechaR2.getTime()) {
        $('#error_FechaR').show();
        correcto = false;
    } else
        $('#error_FechaR').hide();


    return correcto;
}
