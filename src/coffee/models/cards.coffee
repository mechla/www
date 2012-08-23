class Card extends Backbone.Model


class CardsCollection extends  Backbone.Collection
  model: Card
  
  get_random: (start)->
    if(game.user_turn)
      console.log "RANDOM user turn"
      card = @at(Math.floor(Math.random() * @.length))
      @.remove(card)
      $("#big_card_red_bg").hide()
      $("#big_card_blue_bg").show()
      $("#big_card_img").html("<img src='assets/cards/#{card.get("blue")}' />")
    else
      if start
        console.log "RANDOM start =  true " 
        console.log start
        card = @at(Math.floor(Math.random() * (@.length-3))+3)
      else
        console.log "RANDOM start =  false "
        card = @at(Math.floor(Math.random() * @.length))
      @.remove(card)
      $("#big_card_red_bg").show()
      $("#big_card_blue_bg").hide()
      $("#big_card_img").html("<img src='assets/cards/#{card.get("red")}' />")
    # console.log  card
    card


