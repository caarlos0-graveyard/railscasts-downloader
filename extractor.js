// TODO create a script to do this automagically

/*
For now, you will have to run this script in each http://railscasts.com/?page=NUMBER
and copy the results to input.txt.

The first 100 counting from Jun 16, 2013 is already done.
*/
var eps = '/episodes/';
$('h2 a[href^="/episodes"]').each(function () {
  var href = $(this).attr('href')
    , epname = href.substring(href.indexOf(eps) + eps.length);
  console.log(epname);
});
