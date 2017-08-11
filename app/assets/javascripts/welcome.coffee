
sendAJAXRequest = (settings) ->
  token = $('meta[name="csrf-token"]')
  if token.size() > 0
    headers =
      "X-CSRF-Token": token.attr("content")
    settings.headers = headers
  xhrRequestChangeMonth = jQuery.ajax(settings)

onProductSave = ->
  $("#product_save").on "click", ->
    productUrl = $("#product_url").val()

    if productUrl is ""
      $(".url_present").removeClass("hide")
    else if (productUrl.indexOf("amazon") > -1) == false
      console.log "there is no amazon in url"
      $(".amazon_url").removeClass("hide")
    else
      NProgress.start();
      data = {}
      data.product_url = productUrl

      onError = (jqXHR, status, error) ->
        NProgress.done();

      onSuccess = (result, status, jqXHR) ->
        console.log result
        NProgress.done();

      settings =
        cache: false
        data: data
        dataType: 'json'
        error: onError
        success: onSuccess
        contentType: "application/x-www-form-urlencoded"
        type: "POST"
        url: "/fetch_and_add"

      sendAJAXRequest(settings)

    console.log productUrl


sendMetoDb = ->
  console.log "hell"

window.initializeWelcome = ->
  sendMetoDb()
  onProductSave()