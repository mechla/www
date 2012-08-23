class Avatars


  hightlight_player: ()->
    $("#avatar_1_go").show()
    $("#avatar_1_active").show()
    $("#avatar_2").show()

    $("#avatar_2_go").hide()
    $("#avatar_2_active").hide()
    $("#avatar_1").hide()
  hightlight_al: ()->
    $("#avatar_1_go").hide()
    $("#avatar_1_active").hide()
    $("#avatar_2").hide()

    $("#avatar_2_go").show()
    $("#avatar_2_active").show()
    $("#avatar_1").show()
  move_ball: (yards)->
    scale2 = 5.77
    scale = 2.64
    if app.tablet
      # alert app.tablet
      pixels = (195 + Math.round(yards*scale2)).toString()+"px";
      pixels2 = (-241+ Math.round(yards*scale2)).toString()+"px";
    else
      pixels = (110 -15 + Math.round(yards*scale)).toString()+"px";
      pixels2 = (110 - 130 -82+ Math.round(yards*scale)).toString()+"px";
    TweenLite.to($("#ball"),1,{css:left:pixels})

    TweenLite.to($("#game_strip"),1,{css:left:pixels2})

  set_ball: ()->
    scale2 = 5.77
    scale = 2.64
    if app.tablet
      pixels = (195+ Math.round(50*scale2)).toString()+"px";
      pixels2 = (-241+ Math.round(50*scale2)).toString()+"px";
    else
      pixels = (110 - 15 + Math.round(50*scale)).toString()+"px";
      pixels2 = (110 - 130 -82+ Math.round(50*scale)).toString()+"px";

    TweenLite.to($("#ball"),0,{css:left:pixels})

    TweenLite.to($("#game_strip"),0,{css:left:pixels2})

  


