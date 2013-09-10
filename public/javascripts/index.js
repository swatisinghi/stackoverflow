$(document).ready(function() {
    $.ajax({
            dataType: "json",
            url: './data/highest_answered_topic.json',
            success: function(d) {
                Morris.Donut({
                    element: 'highest_answered_topic',
                    data: d
                });
            }
        }
    );

    $.ajax({
            dataType: "json",
            url: './data/highest_voted_topic.json',
            success: function(d) {
                Morris.Donut({
                    element: 'highest_voted_topic',
                    data: d
                });
            }
        }
    );

    $.ajax({
            dataType: "json",
            url: './data/highest_viewed_topic.json',
            success: function(d) {
                Morris.Donut({
                    element: 'highest_viewed_topic',
                    data: d
                });
            }
        }
    );

    $.ajax({
        dataType: "json",
        url: './data/topic_rank.json',
        success: function(rank) {
            console.log(rank);
            var text = "";
            jQuery.each(rank, function(i, val) {
                text += i + 1 + ". " + val + "<br /><br/>";
            });
            $('#topic_rank').html(text);
        }
    });

    $.ajax({
            dataType: "json",
            url: './data/type_views_topic.json',
            success: function(d) {
                Morris.Bar({
                    element: 'type_views_topic',
                    data: d,
                    xkey: 'label',
                    ykeys: ['views', 'hot_views', 'warm_views'],
                    labels: ['Super Nova Views', 'Hot Views', 'Warm Views'],
                    barColors: ['#f00000', '#00f000', '#0000ff']
                });
            }
        }
    );

    $.ajax({
            dataType: "json",
            url: './data/type_answers_topic.json',
            success: function(d) {
                Morris.Bar({
                    element: 'type_answers_topic',
                    data: d,
                    xkey: 'label',
                    ykeys: ['answers', 'accepted_answers'],
                    labels: ['UnAccepted Answers', 'Accepted Answers'],
                    barColors: ['#f00000', '#0000ff']
                });
            }
        }
    );

    $.ajax({
            dataType: "json",
            url: './data1.json',
            success: function(d) {
                Morris.Line({
                    element: 'line_per_tag_1',
                    data: d,
                    xkey: 'y',
                    ykeys: ['a', 'b'],
                    labels: ['Series A', 'Series B']
                });
            }
        }
    );

    $.ajax({
            dataType: "json",
            url: './data1.json',
            success: function(d) {
                console.log(d);
                Morris.Area({
                    element: 'area_per_tag_1',
                    data: d,
                    xkey: 'y',
                    ykeys: ['a', 'b'],
                    labels: ['Series A', 'Series B']
                });
            }
        }
    );

});
