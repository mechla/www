app = new Application()
game =  new GameLogic()
avatars = new Avatars()

ballSound =  null

$("#document").ready ->
  hide_loader()

cards_view =  new  CardsView()

init= ()->
  console.log "init"
  app.init()
  game.init()
  init_sound_manager()
  $("#white").hide()
  $("#heads_button").hide()
  $("#tails_button").hide()
  $("#start_page").show()
  $("#coin_page").hide()
  $("#coin").show()
  $("#coin_big").show()
  $("#you_pick_firs").hide()
  $("#al_pick_firs").hide()
  $("#game_page").hide()
  $("#game_over_page").hide()
  $("#instruction").hide()
  $("#big_card").hide()
  $("#coin_page").unbind()
  bind_instructions()
  $("#play_button").bind "tap click", (e)=>
    $("#play_button").unbind()
    $("#instruction_button").unbind()
    $("#instruction").unbind()
    $("#instruction").hide()
    soundManager.play("ballSound")
    start_coins()
    $("#coin_page").show()
    $("#game_page").show()
    $("#start_page").hide() 

bind_instructions= ()->
  $("#instruction_button").bind "tap click", (e)=>
    $("#instruction_button").unbind()
    $("#instruction").show()
    $("#instruction").bind "tap click", (e)=>
      $("#instruction").unbind()
      $("#instruction").hide()
      bind_instructions()
    $("#instruction_button").bind "tap click", (e)=>
      $("#instruction_button").unbind()
      $("#instruction").hide()
      bind_instructions()

play_game_again= ()->
  game.init()

  $("#heads_button").hide()
  $("#tails_button").hide()
  $("#start_page").hide()
  $("#coin_page").show()
  $("#coin").show()
  $("#coin_big").show()
  $("#you_pick_firs").hide()
  $("#al_pick_firs").hide()
  $("#game_page").show()
  $("#game_over_page").hide()
  $("#instruction").hide()
  $("#big_card").hide()
  $("#coin_page").unbind()
  resume_coin()


hide_loader= ()->
  $("#loader").hide()


initSound= () ->
  # return false  unless soundManager.supported()
  ballSound = soundManager.createSound(
    id: "ballSound"
    url: "YardGrabAudioLoopFinal.mp3"
    volume: 50
    multiShot: false
    autoLoad: true
    autoPlay: false
    loops: 100
    onload: ->
      console.log "The sound " + @id + " loaded!"
      # ballSound.play()
  )
playSound= ()->
  ballSound.play()
  

init_sound_manager= ()->
  console.log "...................init_sound_manager"
  soundManager.setup
    preferFlash: false
    useFlashBlock: true
    url: "/swf/"
    useHighPerformance: true
    debugMode: true
    onready: -> 
      initSound()



  
  











