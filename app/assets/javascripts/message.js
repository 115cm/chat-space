$(function(){
  function buildHTML(message){
    if ( message.image ) {
      var html =
       `<div class="message" data-message-id=${message.id}>
          <div class="upper-message">
            <div class="upper-message__user-name">
              ${message.user_name}
            </div>
            <div class="upper-message__date">
              ${message.created_at}
            </div>
          </div>
          <div class="lower-message">
            <p class="lower-message__content">
              ${message.content}
            </p>
          </div>
          <img src=${message.image} >
        </div>`
      return html;
    } else {
      var html =
       `<div class="message" data-message-id=${message.id}>
          <div class="upper-message">
            <div class="upper-message__user-name">
              ${message.user_name}
            </div>
            <div class="upper-message__date">
              ${message.created_at}
            </div>
          </div>
          <div class="lower-message">
            <p class="lower-message__content">
              ${message.content}
            </p>
          </div>
        </div>`
      return html;
    };
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();

    var formData = new FormData(this);
    var url = $(this).attr('action');

    $.ajax({
      url:          url,
      type:         'POST',
      data:         formData,  
      dataType:     'json',
      processData:  false,
      contentType:  false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $('.chat-main__message-list__container').animate({ scrollTop: $('.chat-main__message-list__container')[0].scrollHeight});
      $('#new_message')[0].reset();
    })
    .fail(function(){
      alert("送信エラー");
    })
    .always(function () {
      $('#message-send-btn').prop('disabled', false);
    });
  })

  if(document.location.href.match(/\/groups\/\d+\/messages/)){
    setInterval(reloadMessages, 7000);
  }
});
