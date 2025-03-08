function commonAjax( url, method, data, callback ) {
    $.ajax({
        url : url,
        type : method,
        data : data,
        dataType : "json",
    }).done( function( response ) {
        if ( callback ) {
            callback(response);
        }
    }).fail( function( error ) {
        alert("에러가 발생했습니다.\n잠시 후 다시 시도해주시기 바랍니다.")
    });
}
function commonAjaxJson( url, method, data, callback ) {
    $.ajax({
        url : url,
        type : method,
        data : JSON.stringify(data),
        contentType : 'application/json',
    }).done( function( response ) {
        if ( callback ) {
            callback(response);
        }
    }).fail( function( error ) {
        alert("에러가 발생했습니다.\n잠시 후 다시 시도해주시기 바랍니다.")
    });
}