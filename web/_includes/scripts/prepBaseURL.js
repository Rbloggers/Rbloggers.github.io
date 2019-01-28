$(function() {
  /////// Have no baseurl yet ///////
  // posturl: ori post path
  // baseurl: ori blog path

  /// Get Base urls
  rst = document.evaluate("/html/body//div[contains(@class, 'article__info')]//span/a/@href", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
  var posturl = rst.value;
  if (posturl.slice(-1) !== '/') var posturl = posturl + '/';
  var pathArray = posturl.split( '/' );
  var baseurl = pathArray[0] + '//' + pathArray[2] + '/';
  
  var regex_http = /^https?:/;

  // Case 1: match "./xxxx" or "xxxx" (relative path)
  var regex_relPath = /^(\.\/){0,1}([^\/\s#]\S+)$/;
  $('.article__content').find('a').each(function() {
    var href = $(this).attr('href');
    if (href !== null && regex_relPath.test(href) && !regex_http.test(href)) {
        // Capture second matched group
        var clean_url = href.match(regex_relPath)[2]
        $(this).attr('href', posturl + clean_url);
    }
  });
  $('.article__content').find('img').each(function() {
    var src = $(this).attr('src');
    if (src !== null && regex_relPath.test(src) && !regex_http.test(src)) {
        // Capture second matched group
        var clean_url = src.match(regex_relPath)[2]
        $(this).attr('src', posturl + clean_url);
    }
  });
  
  // Case 2: match "/xxx" (absolute path)
  var regex_absPath = /^\/(\S+)$/;
  $('.article__content').find('a').each(function() {
    var href = $(this).attr('href');
    if (href !== null && regex_absPath.test(href)) {
        // Capture second matched group
        var clean_url = href.match(regex_absPath)[1]
        $(this).attr('href', baseurl + clean_url);
    }
  });
  $('.article__content').find('img').each(function() {
    var src = $(this).attr('src');
    if (src !== null && regex_absPath.test(src)) {
        // Capture second matched group
        var clean_url = src.match(regex_absPath)[1]
        $(this).attr('src', baseurl + clean_url);
    }
  });
  
});
