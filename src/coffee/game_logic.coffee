class GameLogic
  constructor: ()->
    @cards = new CardsCollection()
    @avaliable_cards = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    @current_action_card  = null
    @user_turn = true
    @ball_yard_possition = 50
    @winner
    @turns = 0

  init: ()->
    avatars.set_ball()
    @avaliable_cards = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    @ball_yard_possition = 50
    $("#big_card").hide()
    console.log  app.tablet
    if app.tablet
      @cards = new CardsCollection(cards_json_big)
    else
      @cards = new CardsCollection(cards_json)
    cards_view.render_cards()

  start: ()->
    if @user_turn
      @user_is_playing()
    else
      avatars.hightlight_al()
      @al_is_plaing()
    init_star()
      
  al_is_plaing: ()->
    game.user_turn =  false
    console.log "AL:"
    avatars.hightlight_al()
    TweenLite.delayedCall(2,game.al_turn)
    game.user_turn =  false

  al_turn: ()->
    game.player_choose_card(game.get_random_card())
    cards_view.al_click()

  user_is_playing: ()->
    avatars.hightlight_player()
    game.user_turn = true
    console.log "USER:"
    cards_view.enable_click()
  
  card_click_callback: ()->
    game.player_choose_card(game.get_random_card())

  get_random_card: ()->
    @turns++
    console.log @turns
    if @turns is 16 
      if @tablet
        @current_action_card =  new Card({
          "id": "asdsa11",
          "red": "YG_card_TDDEFENSE_A(tablet).png",
          "blue": "YG_card_TDOFFENSE_A(tablet).png",
          "action": "win"
        })
      else
        @current_action_card =  new Card({
          "id": "asdsa11",
          "red": "YG_card_TDDEFENSE_A(phone).png",
          "blue": "YG_card_TDOFFENSE_A(phone).png",
          "action": "win"
        })
    else
      @current_action_card = @cards.get_random(@turns<10)

    @current_action_card


  player_choose_card: (card)->
    @update_ball(card.get("action"))

  show_big_card: ()->
    $("#big_card").show()
    TweenLite.delayedCall(3.5,game.hide_big_crad)

  hide_big_crad: ()->
    $("#big_card").hide()

  
  update_ball: (action)->
    if(!(action is "win"  or action is "no gain"))
      if(game.user_turn)
        @ball_yard_possition = @ball_yard_possition - parseInt(action)
      else
        @ball_yard_possition = @ball_yard_possition + parseInt(action)
      $("#is_action").html action
      $("#is_ball").html "yard: "+@ball_yard_possition
      
    else
      $("#is_action").html action
      if action is "win"
        if game.user_turn
          @game_over("player",true)
          @ball_yard_possition = 105
        else
          @game_over("al",true)
          @ball_yard_possition = -5

        $("#is_ball").html "yard: "+@ball_yard_possition
        TweenLite.delayedCall(4.4,avatars.move_ball, [@ball_yard_possition])
        return true
    
    if(@ball_yard_possition <= 0)
      @game_over("al",false)
      @ball_yard_possition = -5
      TweenLite.delayedCall(4.5,avatars.move_ball, [@ball_yard_possition])
      return true
    else 
      if(@ball_yard_possition >= 100)
        @game_over("player",false)
        @ball_yard_possition = 105
        TweenLite.delayedCall(4.5,avatars.move_ball, [@ball_yard_possition])
        return true
      else 
        if game.user_turn 
          TweenLite.delayedCall(7,@al_is_plaing)
        else
          TweenLite.delayedCall(7,@user_is_playing)
      TweenLite.delayedCall(4.5,avatars.move_ball, [@ball_yard_possition])

  game_over: (winner,win)->
    @winner = winner
    if win
      TweenLite.delayedCall(4,@change_page)
    else
      TweenLite.delayedCall(7,@change_page)
    if @winner is "player"
      $("#you_won").show()
      $("#you_lost").hide()
      $("#game_over_bg").hide()
      $("#game_over_bg_win").show()
    else
      $("#you_won").hide()
      $("#you_lost").show()
      $("#game_over_bg_win").hide()
      $("#game_over_bg").show()
   
  change_page: ()->
    $("#game_page").hide()
    $("#game_over_page").show()
    $("#play_again").bind "touchstart click", (e) ->
      $("#play_again").unbind()
      # play_game_again()
      window.location.href=window.location.href
   






