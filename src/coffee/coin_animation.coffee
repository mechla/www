timeout = false
start_coins= ()-> 
  init_spritesheet();


stop_toss= ()->
  if timeout
    console.log ""
  else
    timeout = true
    clearTimeout(timeout)
    $("#coin_page").unbind()
    Ticker.removeAllListeners()
    $("#coin").hide()
    $("#coin_big").hide()
    if bmpAnimation.currentFrame < 4 or bmpAnimation.currentFrame > 9
      game.user_turn = true
      $("#you_pick_firs").show()
      $("#tails_button").show()    
    else
      $("#al_pick_firs").show()
      $("#heads_button").show()
      game.user_turn = false
    TweenLite.delayedCall(3,show_game)

show_game= ()->
  console.log "SHOW GAME"
  $("#coin_page").unbind()
  $("#coin_page").hide()
  $("#game_page").show()
  game.start()
    


canvas = undefined
stage = undefined
screen_width = undefined
screen_height = undefined
bmpAnimation = undefined
coin_animation = new Image()
init_spritesheet = ()->
  console.log "init_spritesheet"
  coin_animation.onload = handleImageLoad
  coin_animation.onerror = handleImageError
  if app.tablet
    canvas = document.getElementById("testCanvasBig")
    coin_animation.src = "assets/coinSheet(tablet).PNG"
  else
    canvas = document.getElementById("testCanvas")
    coin_animation.src = "assets/coinSheet(phone).PNG"

    
reset = ()->
  stage.removeAllChildren()
  Ticker.removeAllListeners()
  stage.update()
handleImageLoad = (e) ->
  console.log "handleImageLoad"
  initCoin()
initCoin = ()->
  console.log "initCoin"
  stage = new Stage(canvas)
  screen_width = canvas.width
  screen_height = canvas.height
  if app.tablet
    spriteSheet = new SpriteSheet(
      images: [ coin_animation ]
      frames:
        width: 330
        height: 330
        regX: 16
        regY: 16

      animations:
        walk: [ 0, 7, "toss" ]
    )
  else
    spriteSheet = new SpriteSheet(
      images: [ coin_animation ]
      frames:
        width: 158
        height: 162
        regX: 16
        regY: 16

      animations:
        walk: [ 0, 7, "toss" ]
    )
  bmpAnimation = new BitmapAnimation(spriteSheet)
  bmpAnimation.gotoAndPlay "toss"
  bmpAnimation.name = "coin"
  bmpAnimation.direction = 90
  bmpAnimation.vX = 4
  bmpAnimation.x = 16
  bmpAnimation.y = 16
  bmpAnimation.currentFrame = 0
  stage.addChild bmpAnimation
  Ticker.addListener window
  Ticker.useRAF = true
  if app.tablet
    Ticker.setFPS 20
  else
    Ticker.setFPS 10
  TweenLite.delayedCall(4+Math.random(),stop_toss)
  $("#coin_page").bind  "tap click", (e)=> 
    $("#coin_page").unbind() 
    stop_toss()

handleImageError = (e) ->
  console.log "!!!!!!!!!!Error Loading Image : " + e.target.src

tick = ()->
  stage.update()

resume_coin = ()->
  initCoin()
  $("#coin_page").unbind()
  $("#coin_page").bind  "touchstart click", (e)=>
    $("#coin_page").unbind()
    stop_toss()

