var questions = $('.question-summary');

questions.each(function(index, question) {
    var votes = $('.vote-count-post strong', question).html();
    if (votes == null)
        votes = 0;
    var answers = $('.answered strong', question).html();
    if (answers == null)
        answers = 0;
    var accepted_answers = $('.answered-accepted strong', question).html();
    var views = $('.supernova', question).html();
    if (views !== null)
        views = views.replace(/\s+/g, '').replace('views', '').replace('k', '');
    else if (views == null)
        views = 0;
    var hotViews = $('.hot', question).html();
    if (hotViews !== null)
        hotViews = hotViews.replace(/\s+/g, '').replace('views', '').replace('k', '');
    else if (hotViews == null)
        hotViews = 0;
    var warmViews = $('.warm', question).html();
    if (warmViews !== null)
        warmViews = warmViews.replace(/\s+/g, '').replace('views', '').replace('k', '');
    else if (warmViews == null)
        warmViews = 0;
    var title = $('.question-hyperlink', question).html().replace(',', '').replace(',', '').replace('\'', '');

    console.log(votes + "," + answers + "," + accepted_answers + "," + views + "," + hotViews + "," + warmViews + "," + title);
});
