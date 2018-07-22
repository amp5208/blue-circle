var pretty = require('pretty');
var fs = require('fs');

/**
 * Cleans and lints html in website.
 * Useful to ensure at least flat
 * web pages are validated.
 */
function htmlLinter() {
  var html = '';
  var webpageFile = './web/index.html';

  function getWebData(callback) {
    html = fs.readFileSync(webpageFile).toString();
    callback();
  }

  function setCleanWebData() {
    if (!html.trim()) {
      return console.log('ERROR: No data to save');
    } else {
      fs.writeFile(webpageFile, html, function(err) {
        if (err) {
          return console.log(err);
        }
      });

      console.log('Successfully linted html');
    }
  }

  getWebData(function() {
    html = pretty(html);
    setCleanWebData();
  });
}

htmlLinter();
