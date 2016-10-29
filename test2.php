<html><head><!-- CSS --><link href='assets/css/bubbleChart.css' type='text/css'><link href="https://fonts.googleapis.com/css?family=Oswald:300"><script src="https://www.gstatic.com/charts/loader.js"></script><!-- Gchart library --><script type="text/javascript" src="assets/js/lib/gcharts.js"></script><!-- Script of the chart --><script type="text/javascript" src="assets/js/app/bubbleChart.js"></script><style>html {
    background-color: #111;
}

</style></head><body><div id="series_chart_div" style="width: 1000px; height: 700px;"></div><script>google.charts.load('current', {
    'packages': ['corechart']
}

);
google.charts.setOnLoadCallback(drawSeriesChart);
function drawSeriesChart() {
    var data=google.visualization.arrayToDataTable([ ['Movie\'s names', 'Oscar\'s year', 'Number of Users', 'Genre', 'Budget'], [ '7th Heaven', 1929, 3, 'Romance', 1000000], [ 'In Old Arizona', 1930, 5, 'Western', 1300000], [ 'All Quiet on the Western Front', 1931, 2, 'Western', 1200000], [ 'Cimarron', 1932, 3, 'Western', 1433000], [ 'Bad Girl', 1933, 2, 'Romance', 1100000], [ 'Cavalcade', 1934, 3, 'Drama', 1180280], [ 'It Happened One Night', 1935, 5, 'Romance', 325000], [ 'The Informer', 1936, 4, 'Drama', 243000], [ 'Anthony Adverse', 1937, 4, 'Drama', 1000000], [ 'The Life Of Emile Zola', 1938, 3, 'History', 1000000], [ 'The Adventures of Robin Hood', 1939, 3, 'Action', 2033000], [ 'Gone With The Wind', 1940, 8, 'Romance', 3850000], [ 'The Thief of Bagdad', 1941, 3, 'Action', 1000000], [ 'How Green Was My Valley', 1942, 5, 'Drama', 800000], [ 'Mrs. Miniver', 1943, 6, 'Romance', 1340000], [ 'The Song of Bernadette', 1944, 4, 'Drama', 1600000], [ 'Going My Way', 1945, 7, 'Comedy', 5000000], [ 'The Lost Weekend', 1946, 4, 'Drama', 1250000], [ 'The Best Years of Our Lives', 1947, 7, 'Drama', 2100000], [ 'Gentleman\'s Agreement', 1948, 3, 'Drama', 1985000], [ 'Hamlet', 1949, 4, 'Drama', 527530], [ 'The Heiress', 1950, 4, 'Drama', 2600000], [ 'All About Eve', 1951, 6, 'Drama', 1400000], [ 'An American in Paris', 1952, 6, 'Comedy', 2724000], [ 'The Bad and the Beautiful', 1953, 5, 'Romance', 1558000], [ 'From Here to Eternity', 1954, 8, 'Drama', 2500000], [ 'On the Waterfront', 1955, 8, 'Drama', 910000], [ 'Around the World in 80 Days', 1956, 5, 'Comedy', 6000000], [ 'The Bridge on the River Kwai', 1957, 7, 'History', 2800000], [ 'Gigi', 1958, 9, 'Romance', 3319355], [ 'Ben-Hur', 1959, 11, 'History', 15200000], [ 'The Apartment', 1960, 5, 'Comedy', 3000000], [ 'West Side Story', 1961, 10, 'Romance', 6000000], [ 'Lawrence of Arabia', 1962, 7, 'History', 15000000], [ 'Tom Jones', 1963, 4, 'Comedy', 1000000], [ 'My Fair Lady', 1964, 8, 'Romance', 17000000], [ 'The Sound of Music', 1965, 5, 'Drama', 8200000], [ 'A Man for All Seasons', 1966, 6, 'Drama', 2000000], [ 'In the Heat of the Night', 1967, 5, 'Drama', 2000000], [ 'Oliver!', 1968, 5, 'Drama', 5000000], [ 'Butch Cassidy and the Sundance Kid', 1969, 4, 'Western', 6000000], [ 'Patton', 1970, 7, 'History', 12600000], [ 'The French Connection', 1971, 5, 'Thriller', 1800000], [ 'Cabaret', 1972, 8, 'Romance', 2285000], [ 'The Sting', 1973, 7, 'Action', 5500000], [ 'The Godfather Part II', 1974, 6, 'Drama', 13000000], [ 'One Flew Over the Cuckoo\'s Nest', 1975, 5, 'Drama', 3000000], [ 'Network', 1976, 4, 'Comedy', 3800000], [ 'Star Wars: Episode IV â€“ A New Hope', 1977, 7, 'Science-Fiction', 11000000], [ 'The Deer Hunter', 1978, 5, 'Drama', 15000000], [ 'Kramer vs. Kramer', 1979, 5, 'Drama', 8000000], [ 'Ordinary People', 1980, 4, 'Drama', 6000000], [ 'Chariots of Fire', 1981, 4, 'History', 3000000], [ 'Gandhi', 1982, 8, 'History', 22000000], [ 'Terms of Endearment', 1983, 5, 'Comedy', 8000000], [ 'Amadeus', 1984, 8, 'History', 18000000], [ 'Out of Africa', 1985, 7, 'Romantic', 28000000], [ 'Platoon', 1986, 4, 'History', 6000000], [ 'The Last Emperor', 1987, 9, 'History', 23800000], [ 'A Beautiful Mind', 2002, 4, 'Drama', 58000000], [ 'Chicago', 2003, 6, 'Action', 45000000], [ 'The Lord of the Rings: The Return of the King', 2004, 11, 'Action', 94000000], [ 'The Aviator', 2005, 5, 'History', 110000000], [ 'Brokeback Mountain', 2006, 3, 'Romance', 14000000], [ 'The Departed', 2007, 4, 'Drama', 90000000], [ 'No Country for Old Men', 2008, 4, 'Thriller', 25000000], [ 'Slumdog Millionaire', 2009, 8, 'Drama', 15000000], [ 'The Hurt Locker', 2010, 6, 'History', 15000000], [ 'The King\'s Speech', 2011, 4, 'History', 15000000], [ 'The Artist', 2012, 5, 'Romance', 15000000], [ 'No Country for Old Men', 2008, 4, 'Thriller', 25000000], [ 'Slumdog Millionaire', 2009, 8, 'Drama', 15000000], [ 'The Hurt Locker', 2010, 6, 'History', 15000000], [ 'The King\'s Speech', 2011, 4, 'History', 15000000], [ 'The Artist', 2012, 5, 'Romance', 15000000], [ 'Life Of Pi', 2013, 4, 'Action', 120000000], [ 'Gravity', 2014, 6, 'Science-Fiction', 100000000], [ 'Birdman', 2015, 4, 'Comedy', 18000000], [ 'Mad Max : Fury Road', 2016, 6, 'Science-Fiction', 104924543]]);
    var options= {
        // General settings
        title: 'Correlation between the time, the number of users, '+'their emotions',
        legend: 'none',
        backgroundColor: '#0C0C0C',
        titleTextStyle: {
            color: '#C4C4C4', fontName: 'helvetica, arial', fontSize: 18, opacity: 1,
        }
        , // Chart area options
        chartArea: {
            backgroundColor: '#0C0C0C', left: 50, top: 50, width: 1200,
        }
        , //Define colors for the labels
        colors: [ '#ddd7ca',
        '#565247',
        '#b9c4a5',
        '#c5a54e',
        '#776e6e',
        '#c19d8f',
        '#5a6654',
        '#c44e4e'], // Options For X axis
        hAxis: {
            title: 'Time',
            titleTextStyle: {
                color: '#C4C4C4', fontName: 'helvetica, arial', fontSize: 16, baselineColor: '#C4C4C4'
            }
            ,
            gridlines: {
                count: 80, color: '#0C0C0C',
            }
            ,
            format: '####',
            /*scaleType: null,*/
        }
        , // Options For Y axis
        vAxis: {
            'backgroundColor':'red',
            title: 'Number of users',
            titleTextStyle: {
                color: '#C4C4C4', fontName: 'helvetica, arial', fontSize: 16,
            }
            ,
            baselineColor: '#0C0C0C',
            gridlines: 0,
            ticks: [0,
            100,
            200,
            300,
            400,
            500,
            600,
            700,
            800],
            gridlines: {
                color: '#0C0C0C',
            }
            ,
        }
        , // Options For The Bubble
        bubble: {
            textStyle: {
                fontSize: 0, opacity: 0, fontName: 'helvetica, arial'
            }
            ,
            opacity: 0.8,
            color: '#C4C4C4',
            stroke: 'transparent',
        }
        , // Bulle config
        sizeAxis: {
            maxSize: '170px', minSize: '50px',
        }
        , // Config du tooltip
        tooltip : {
            textStyle : {
                color: '#505050'
            }
            ,
            showColorCode: false,
        }
        , //Animation
        animation: {
            duration: '1000', easing: 'easeIn', startup: 'true'
        }
        ,
    }
    ;
    var chart=new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
    chart.draw(data, options);
}

</script></body></html>