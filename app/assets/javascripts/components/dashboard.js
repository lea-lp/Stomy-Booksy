$( document ).ready(function() {

    // HIDE
    // $("#hide-rdv").hide();
    // $("#hide-resource-list").hide();
    // $("#hide-resource-add").hide();
    // $("#hide-calendar").hide();

    // SHOW
    $("#rdv").click(function(){
        $("#hide-rdv").toggle();
    });
    $("#list-resource").click(function(){
        $("#hide-resource-list").toggle();
    });
    $("#add-resource").click(function(){
        $("#hide-resource-add").toggle();
    });
    $("#calendar").click(function(){
        $("#hide-calendar").toggle();
    });

});
