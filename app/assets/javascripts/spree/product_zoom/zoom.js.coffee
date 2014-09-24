add_image_handlers = ->
  ($ 'ul.thumbnails a').on 'click', (event) ->
    ($ '#main-image>a.fancybox').attr 'href', ($ event.currentTarget).data('zoom')

show_variant_images = (variant_id) ->
  currentThumb = ($ '#' + ($ '#main-image').data('selectedThumbId'))
  ($ '#main-image>a.fancybox').attr 'href', currentThumb.find('a').data('zoom')

$ ->
  add_image_handlers()
  show_variant_images ($ '#product-variants input[type="radio"]').eq(0).attr('value') if ($ '#product-variants input[type="radio"]').length > 0
  ($ '#product-variants input[type="radio"]').click (event) ->
    show_variant_images @value
  ($ '#main-image>a.fancybox').click (event) ->
    $.fancybox.open([ { href: ($ event.currentTarget).attr('href') } ])
    false
