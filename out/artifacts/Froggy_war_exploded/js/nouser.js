(function () {
    if( noUser != null ){
        document.getElementById("no-user").style.display = "block";
    } else {
        document.getElementById("no-user").style.display = "none";
    }
    if ( loggedIn != null) {
        document.getElementById("user-nav").style.display = "block";
    } else {
        document.getElementById("user-nav").style.display = "none";
    }
}());