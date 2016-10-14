//  -------------Answer1-------------

// create a function to get parameters by their name
// assuming "http://www.tingo.com/hotels/San-Francisco-California-United-States/60713?searchDone=1&a=2016-08-09&d=2016-08-11&..."

function getParameterByName(url) {
    if (!url) url = window.location.href; // includes current url from window
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

var checkindate = getParameterByName('a'); // 2016-08-09
console.log(checkindate);
var checkoutdate = getParameterByName('d'); // 2016-08-11
console.log(checkoutdate);

// assuming "/hotels/San-Francisco-California-United-States/60713" 

var pathArray = window.location.pathname.split('/'); // ["", "hotels", "San-Francisco-California-United-States", "60713"]
var hotel_location = pathArray[2]; // "San-Francisco-California-United-States"
console.log(hotel_location);



//  -------------Answer2-------------

// set a time interval to update heading after 3000ms 

setInterval(function() {

    // includes a variable in heading "h3"

    ($(".listing_summary").find('h3')).html("Searching <var id='countlisting'></var> out of 356 San Francisco Hotels")

    // variable value would be equal to the total number of hotel listing loaded in a page

    document.getElementById('countlisting').innerHTML = $('#hotel_listings > li').length;

    // changed "fontStyle" to "normal" , it was "italic" before

    document.getElementById("countlisting").style.fontStyle = "normal";
}, 3000);




//  -------------Answer3-------------

// create a new div
// place div inside "#refine_search_container #search_form" id 

var outerdiv = document.createElement('div');
outerdiv.setAttribute('id', 'selected_hotel_outerdiv');
outerdiv.class = 'row';
outerdiv.style.background = "#f6fbfd;"; // set up CSS properties for outerdiv
outerdiv.style.borderTop = "1px #ccc solid";
outerdiv.style.display = "block";
outerdiv.style.fontWeight = "bold";
outerdiv.style.background = "linear-gradient(#ecf7fb,#fff)";
outerdiv.style.fontFamily = "arial,helvetica,sans-serif";
outerdiv.style.padding = "10px 14px 5px";
outerdiv.style.fontSize = "13px";
outerdiv.innerHTML = "Selected Hotels"; // header portion
document.getElementById("search_form").appendChild(outerdiv) // finally insert div inside other div with an id of placeholder 



var innerdiv = document.createElement('div');
innerdiv.setAttribute('id', 'selected_hotel_innerdiv');
innerdiv.class = 'content';
innerdiv.style.fontWeight = "normal"; // set up CSS properties for "innerdiv"
innerdiv.style.fontFamily = "arial,helvetica,sans-serif";
innerdiv.style.position = "relative";
innerdiv.style.display = "block";
innerdiv.style.fontSize = "12px";
innerdiv.style.padding = "5px 0px 5px";
innerdiv.style.listStyle = "none";
document.getElementById("selected_hotel_outerdiv").appendChild(innerdiv)



// an id for "Select" button
$("#hotellist-quickview #list-view li.rate .rate_information_container .rate_information .prominent_button").on('click', (function(e) {
    e.preventDefault();
    window.open(this.href) // on "Select" button click, open current hotel in new tab
    var pathArray = this.href.split('/'); // splits the url path of current selected hotel

    // assuming "http://www.tingo.com/hotel/Parc-55-San-Francisco-a-Hilton-Hotel-San-Francisco-California/81192/"


    var hotel_name = pathArray[4]; // "Parc-55-San-Francisco-a-Hilton-Hotel-San-Francisco-California"

    // match current "hotel_name" with the "hotel_name" included in the list

    exist = $('#selected_hotel_innerdiv li').filter(function() {
        return $(this).text() == hotel_name
    });

    // "exist" variable includes the matched "hotel_name"
    // duplicate items would not included in the list

    if (!exist.length)
        $('#selected_hotel_innerdiv').append('<li>' + hotel_name + '</li></br>');
}))