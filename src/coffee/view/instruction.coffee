
add_instruction_events= ()->
  intsruction_visible = true
  $("#instruction_button").live "click touchstart", (e)=>
    console.log  "click #instruction_button."+intsruction_visible
    if intsruction_visible
      intsruction_visible = false
      $("#instruction").show()
    else
      intsruction_visible = true
      $("#instruction").hide()

      

