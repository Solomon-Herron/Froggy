(function () {
    // if( noUser != null ){
    //     document.getElementById("no-user").style.display = "block";
    // } else {
    //     document.getElementById("no-user").style.display = "none";
    // }
    if ( loggedIn != null) {
        document.getElementById("buglist").style.display = "block";
    } else {
        document.getElementById("buglist").style.display = "none";
    }
}());