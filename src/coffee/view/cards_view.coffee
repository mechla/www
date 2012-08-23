class CardsView
  constructor: ->
    @avaliable_cards = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    tags = [ "+30", "+20", "+10", "-10", "-20", "-30", "invert", "?" ]
    tags = tags.concat(tags)
    i = 0
    while i < 16
      tags[i] = "/" + tags[i]  if i > 7
      i++
  
  resize: ()->
    pixels = app.window_width.toString()+"px"
    TweenLite.to($("#wrapper"),1,{css:{width:pixels}});

  render_cards: ()->
    $("#table figure").unbind()
    @avaliable_cards = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    tags = [ "+30", "+20", "+10", "-10", "-20", "-30", "invert", "?" ]
    tags = tags.concat(tags)
    i = 0
    while i < 16
      tags[i] = "/" + tags[i]  if i > 7
      i++

    $("#table").html("<div></div>")
    #   $("#table").fadeOut 
    i = 0
    while i < 16
      $("#table").append "<div><figure id='card" + i + "' class='" + i + "'></figure></div>"
        # $("#table").append "<div><figure id='card" + i + "' class='" + i + "'><p><img src='assets/card.png' /></p></figure></div>"
      i++
    # $("#table").fadeIn()

  al_click: ()->
    id = Math.floor(Math.random() * (@avaliable_cards.length-1))
    card_id = @avaliable_cards[id]
    TweenLite.delayedCall(1,game.show_big_card)
    $(".#{card_id}").animate
      width: 0
      # left: "50%"
    , 200, "swing"
    @remove_from_avaliable_cards(id)

  remove_from_avaliable_cards: (id)->
    to_remove = @avaliable_cards.indexOf(parseInt(id))
    # console.log  "TO REMOVE"
    # console.log id
    # console.log @avaliable_cards
    if(to_remove isnt -1) 
      @avaliable_cards.splice(to_remove, 1)

  enable_click: ()->
    $("#table figure").bind "click", ->
      TweenLite.delayedCall(1,game.show_big_card);
      $("#table figure").unbind()
      if not $(this).hasClass("open")
        game.card_click_callback()
        cards_view.remove_from_avaliable_cards($(this).attr("class"))
        id = $(this).attr("class")
        # TweenLite.to($this,2,{css:{scaleX:0}})
        $(".#{id}").animate
          width: 0
          # left: "50%"
        , 200, "swing"
        # $(this).animate
        #   width: 0
        #   # left: "50%"
        # , 200, "swing"



