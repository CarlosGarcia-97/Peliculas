$('[id^="btn-delete"]').click( function() {
    let code = $(this).attr('data-code');
    let text = $(this).attr('data-text');

    $('#id').val(code);
    $('#text-delete').text(text);
});

$('[id^="btn-details"]').click(function (){
    let id = $(this).attr('data-code');
    let data = {
        id: id
    }

    $.ajax({
        type: 'POST',
        url:'http://localhost:8080/Servles_war/findById',
        data: JSON.stringify(data)
    }).done(function (res){
        console.log(res);
    })
})