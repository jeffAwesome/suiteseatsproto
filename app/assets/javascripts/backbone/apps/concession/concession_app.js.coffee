setTimeout ->


  $(".accordion-arrow").each ->
    that = $(this)

    that.on 'click', (e) ->
      accordionDetails = that.parent().parent().parent().find('.accordion-details')
      upImage = that.parent().find('.up-arrow');
      downImage = that.parent().find('.down-arrow');

      console.log that.parent().parent()

      if upImage.hasClass('hide')
        upImage.removeClass('hide')
        downImage.addClass('hide')
      else
        downImage.removeClass('hide')
        upImage.addClass('hide')

      if accordionDetails.hasClass('hide')
        accordionDetails.slideDown(200).removeClass('hide')
      else
        accordionDetails.slideUp(200).addClass('hide')

  formatMoney = (x) ->
    x = if isNaN(x) or x == '' or x == null then 0.00 else x
    '$' + parseFloat(x).toFixed(2)

  updateCartTotal = () ->
    amount = $(".amount")
    totalItems = 0
    window.totalAmount = 0
    $(".productitem").each ->
      totalItems = parseInt($(this).attr("data-item-quantity"), 10)
      totalAmount += ($(this).attr("data-item-price") * totalItems)
      amount.html(formatMoney(totalAmount/100))

  $(".itemselection").each ->
    value = parseInt($(this).find(".cnt").html(), 10)
    that = $(this)

    that.find('.plus').on 'click', (e) ->
      newValue = value+=1
      that.find('.cnt').html(newValue)
      that.parent('.productitem').attr('data-item-quantity', newValue)
      updateCartTotal()

    that.find('.subtract').on 'click', (e) ->
      if value > 0
        newValue = value-=1
        that.find('.cnt').html(newValue)
        that.parent('.productitem').attr('data-item-quantity', newValue)
        updateCartTotal()
      else
        that.parent('.productitem').attr('data-item-quantity', 0)
        updateCartTotal()

      return true

  $(".btncheckout").not("#payOrder, #completeOrder").click (e) ->
    createOrder()

  $("#payOrder").click (e) ->
    payOrder()

  $("#completeOrder").click (e) ->
    console.log e
    window.currentOrder = e.currentTarget.dataset.id
    completeOrder()


, 300


createOrder = () ->
  $.ajax(
    url: '/orders'
    type: "POST"
    data: {
      order: {
        amount: window.totalAmount
        paid: false
        completed: false
        status: "Pending Payment"
      }
    }
    success: (e) ->
      console.log "hey its working"
      window.currentOrder = e.id
      findOrderItems()
    error: () ->
      console.log "hey we failed"
  )

payOrder = () ->
  $.ajax(
    url: '/orders/'+window.currentOrder
    type: "PUT"
    data: {
      order: {
        status: 'order started'
        paid: true
      }
    }
    success: (e) ->
      setTimeout ->
        window.location.href = '/orders/'+window.currentOrder
      , 300
    error: () ->
      setTimeout ->
        window.location.href = '/orders/'+window.currentOrder
      , 300
      console.log "hey we failed"
  )


completeOrder = (e) ->
  console.log "were in the complete order tab"
  $.ajax(
    url: '/orders/'+window.currentOrder
    type: "PUT"
    data: {
      order: {
        status: 'Delivered'
      }
    }
    success: (e) ->
      setTimeout ->
        window.location.href = '/orders/'
      , 300
    error: () ->
      window.location.href = '/orders/'
  )




createOrderItems = (itemName, itemAmount, itemQuantity) ->
  $.ajax(
    url: '/order_items'
    type: "POST"
    data: {
      order_item: {
        order_id: window.currentOrder
        item_amount: itemAmount
        item_name: itemName
        item_quantity: itemQuantity
      }
    }
    success: () ->
      console.log "hey its working"
    error: () ->
      console.log "hey we failed"
  )


findOrderItems = () ->
  $(".productitem").each ->
    itemName =  $(this).attr("data-item-name")
    itemQuantity = $(this).attr("data-item-quantity")
    itemPrice = $(this).attr("data-item-price")
    itemAmount = itemPrice * itemQuantity
    createOrderItems(itemName, itemAmount, itemQuantity)

  setTimeout ->
    window.location.href = "/orders/"+window.currentOrder
  , 350

