

setTimeout ->
  $(".itemselection").each ->
    value = parseInt($(this).find(".cnt").html(), 10)
    that = $(this)
    that.find('.plus').on 'click', (e) ->
      newValue = value+=1
      that.find('.cnt').html(newValue)

    that.find('.subtract').on 'click', (e) ->
      if value > 0
        newValue = value-=1
        that.find('.cnt').html(newValue)

, 300
