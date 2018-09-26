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
    if (montoT == '') {
        $('#error_MontoT').show();
        correcto = false;
    } else
        $('#error_MontoT').hide();

    var montoE = $('#MontoE').val();
    if (montoE == '') {
        $('#error_MontoE').show();
        correcto = false;
    } else
        $('#error_MontoE').hide();

    var fechaR = new Date($('#FechaR').val());
    var hoy = new Date();
    var dia = hoy.getDay() - 1;
    var mes = hoy.getMonth() + 1;
    var anio = hoy.getFullYear();

    if (fechaR.getFullYear() <= anio) {
        $('#error_FechaR').hide();
        if (fechaR.getMonth() <= mes) {
            $('#error_FechaR').hide();
           if (fechaR.getDay() > dia) {
                $('#error_FechaR').hide();
            } else {
                $('#error_FechaR').show();
                return false;
            }
        } else {
            $('#error_FechaR').show();
            return false;
        }
    } else {
        $('#error_FechaR').show();
        return false;
    }

    return correcto;
}
