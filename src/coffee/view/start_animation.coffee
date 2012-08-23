init_star= ()->
  init_spritesheet_star();
  # start_star()

start_star= ()->
  $("#start").show()
  Ticker.addListener window
  
stop_star= ()->
  $("#start").hide();
  Ticker.removeAllListeners()

canvas_star = undefined
stage = undefined
screen_width_star = undefined
screen_height_star = undefined
bmpAnimation_star = undefined
coin_animation_star = new Image()
init_spritesheet_star = ()->
  if app.tablet
    canvas_star = document.getElementById("testStarBig")
  else
    canvas_star = document.getElementById("testStar")
  coin_animation_star.onload = handleImageLoad_star
  coin_animation_star.onerror = handleImageError_star
  if app.tablet
    coin_animation_star.src = "assets/effectSheet_(tablet).PNG"
  else
    coin_animation_star.src = "assets/effectSheet_(phone).png"
reset_star = ()->
  stage.removeAllChildren()
  Ticker.removeAllListeners()
  stage.update()
handleImageLoad_star = (e) ->
  startGame_star()
startGame_star = ()->
  console.log "INIt STAGE,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,"
  stage = new Stage(canvas_star)
  screen_width_star = canvas_star.width
  screen_height_star = canvas_star.height
  if app.tablet 
    spriteSheet_star = new SpriteSheet(
      images: [ coin_animation_star ]
      frames:
        width: 550
        height: 550
        regX: 16
        regY: 16

      animations:
        walk: [ 0, 3, "star" ]
    )

  else
    spriteSheet_star = new SpriteSheet(
      images: [ coin_animation_star ]
      frames:
        width: 280
        height: 280
        regX: 16
        regY: 16

      animations:
        walk: [ 0, 3, "star" ]
    )
  bmpAnimation_star = new BitmapAnimation(spriteSheet_star)
  bmpAnimation_star.gotoAndPlay "star"
  bmpAnimation_star.name = "coin"
  bmpAnimation_star.direction = 90
  bmpAnimation_star.vX = 4
  bmpAnimation_star.x = 16
  bmpAnimation_star.y = 16
  bmpAnimation_star.currentFrame = 0
  stage.addChild bmpAnimation_star
  Ticker.addListener window
  Ticker.useRAF = true
  if app.tablet
    Ticker.setFPS 20
  else
    Ticker.setFPS 10

handleImageError_star = (e) ->
  console.log "Error Loading Image : " + e.target.src

tick = ()->
  stage.update()
