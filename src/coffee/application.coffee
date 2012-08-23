class Application

  constructor: ->
    $(document).bind "mobileinit", ->
      $.mobile.allowCrossDomainPages = true
    @href = window.location.href
    @scale = 1
    @do_alert = true
    @ua = navigator.userAgent.toLowerCase()
    @tablet = (((@ua.indexOf("mac") > -1) and (@ua.indexOf("iphone") < 0)) or (@ua.indexOf("win") > -1) or ((@ua.indexOf("linux") > -1) and (@ua.indexOf("android") < 0)) or ((@ua.indexOf("ipod") > -1) and (@ua.indexOf("mac") < 0)))
    # alert "app.tablet "+@tablet
    @coin_toss

  init: ->
    console.log "GRAP YARD"
    @apply_css()
    window.addEventListener "resize", @resize, false
    window.addEventListener "orientationchange", @resize, false


  alert_log: (text)->
    if(@do_alert)
      alert text
    else
      console.log text

  resize: ->
    setTimeout app.apply_css(), 500

  apply_css: ->
    if app.tablet 
      game_width =  1024
      game_height = 768
    else
      game_width = 480
      game_height = 320
    if $(window).height() >= $(window).width()
      @scale = $(window).width() / game_width
    else 
      @scale = $(window).height() / game_height
    console.log @scale
    # alert $(window).width()+" "+$(window).height()+" "+@scale
    $("#game").css("-webkit-transform","scale(#{@scale})")
    $("#game").css("-moz-transform","scale(#{@scale})")
    $("#game").css("-ms-transform","scale(#{@scale})")
    $("#game").css("-o-transform","scale(#{@scale})")
    margin  = (game_height*@scale-game_height)/2
    console.log margin+" "+@scale
    $("#game").css("top", "#{margin}px")

  initSound: () ->
    # return false  unless soundManager.supported()
    @ballSound = soundManager.createSound(
      id: "ballSound"
      url: "YardGrabAudioLoopFinal.mp3"
      volume: 50
      multiShot: false
      autoLoad: true
      autoPlay: false
      loops: 100
      onload: ->
        console.log "The sound " + @id + " loaded!"
        app.ballSound.play()
    )
    

  init_sound_manager: ()->
    console.log "...................init_sound_manager"
    soundManager.setup
      preferFlash: false
      useFlashBlock: true
      url: "/swf/"
      useHighPerformance: false
      debugMode: false
      onready: -> 
        app.initSound()


 



        
 


