#!/usr/bin/env node

var fs = require('fs')
  , cheerio = require('cheerio')
  , http = require('http');

var MAX_PAGE = 48
  , EPS = '/episodes/';

// get all pages
var getPages = function () {
  for (var i = 1; i <= MAX_PAGE; i++) {
    getPage(i);
  }
};

// get a given page
var getPage = function (page) {
  console.log('Downloading page %s', page);
  var filename = 'pages/' + page + '.html'
    , stream = fs.createWriteStream(filename);

  stream.on('close', function () {
    parse(filename);
  });

  http.get('http://railscasts.com/?page=' + page, function (res) {
    res.pipe(stream);
  });
};

// parse a specific filename from some page
var parse = function (filename) {
  console.log('\nParsing "%s"', filename);
  var html = fs.readFileSync(filename)
    , $ = cheerio.load(html);

  $('h2 a[href^="' + EPS + '"]').each(function (i, elem) {
    var href = $(this).attr('href');
    appendEpName(href);
  });
};

// append it to input.txt
var appendEpName = function (href) {
  var epname = href.substring(href.indexOf(EPS) + EPS.length)
    , index = epname.indexOf('-')
    , number = ('000' + epname.substring(0, index)).slice(-3)
    , name = epname.substring(index)
    , newEpName = number + name;

  console.log('Found EP "%s"', newEpName);
  fs.appendFile('../input.txt', newEpName + '\n', function (err) {
    if (err) {
      console.error('Failed to append ' + newEpName + ' to input file!');
    }
  });
}

if (require.main == module) {
  fs.unlink('../input.txt', function (err) {
    getPages();
  });
} else {
  exports.getPages = getPages;
}


