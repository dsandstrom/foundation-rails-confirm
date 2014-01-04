$.fn.foundation_confirmbox =
  defaults:
    title: null
    proceed: "OK"
    proceed_class: "button tiny right"
    cancel: "Cancel"
    cancel_class: "button secondary tiny"
    fade: false

FoundationConfirmBox = (message, element, callback) ->
  $dialog = $('
    <div class="reveal-modal small" id="confirmation_dialog" data-reveal>
      <h4 class="title"></h4>
      <p class="body"></p>
      <div class="footer"></div>
      <a class="close-reveal-modal">&#215;</a>
    </div>
  ')

  $dialog
    .find(".title")
      .html(element.data("confirm-title") || $.fn.foundation_confirmbox.defaults.title || window.top.location.origin)
    .end()

    .find(".body")
      .html(message.replace(/\n/g, "<br />"))
    .end()

    .find(".footer")
      .append(
        $("<a />", {href: "#"})
          .html(element.data("confirm-cancel") || $.fn.foundation_confirmbox.defaults.cancel)
          .addClass($.fn.foundation_confirmbox.defaults.cancel_class)
          .addClass(element.data("confirm-cancel-class"))
          .click((event) ->
            event.preventDefault()
            $dialog.foundation('reveal', 'close').remove()
            false
          )
        ,
        $("<a />", {href: "#"})
          .html(element.data("confirm-proceed") || $.fn.foundation_confirmbox.defaults.proceed)
          .addClass($.fn.foundation_confirmbox.defaults.proceed_class)
          .addClass(element.data("confirm-proceed-class") || "btn-primary")
          .click((event) ->
            event.preventDefault()
            $dialog.foundation('reveal', 'close')
            callback()
          )
      )
    .end()
    .appendTo(document.body)
    .foundation('reveal', 'open')

$.rails.allowAction = (element) ->
  message = element.data("confirm")
  answer = false
  return true unless message

  if $.rails.fire(element, "confirm")
    FoundationConfirmBox message, element, ->
      if $.rails.fire(element, "confirm:complete", [answer])
        allowAction = $.rails.allowAction

        $.rails.allowAction = ->
          true
        
        if element.get(0).click
          element.get(0).click()
          
        else if Event?
          evt = new Event("click", {
            bubbles: true,
            cancelable: true,
            view: window,
            detail: 0,
            screenX: 0,
            screenY: 0,
            clientX: 0,
            clientY: 0,
            ctrlKey: false,
            altKey: false,
            shiftKey: false,
            metaKey: false,
            button: 0,
            relatedTarget: document.body.parentNode
          })
          element.get(0).dispatchEvent(evt)

        else if $.isFunction(document.createEvent)
          evt = document.createEvent "MouseEvents"
          evt.initMouseEvent(
            "click",
            true,   # e.bubbles,
            true,   # e.cancelable,
            window, # e.view,
            0,      # e.detail,
            0,      # e.screenX,
            0,      # e.screenY,
            0,      # e.clientX,
            0,      # e.clientY,
            false,  # e.ctrlKey,
            false,  # e.altKey,
            false,  # e.shiftKey,
            false,  # e.metaKey,
            0,      # e.button,
            document.body.parentNode # e.relatedTarget
          )
          element.get(0).dispatchEvent(evt)

        $.rails.allowAction = allowAction
  
  false
