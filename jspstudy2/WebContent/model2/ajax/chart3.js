 var color = Chart.helpers.color;
  var barChartData = {
	labels: ['1-1', '1-2', '2-1', '2-2', '3-1', '3-2'],
    datasets: [{
      type: 'bar',
      label: 'Dataset 1',
      backgroundColor: color(window.chartColors.red).alpha(0.2).rgbString(),
      borderColor: window.chartColors.red,
      data: [
    		4.5, 
			4.0,
			2.5,
			3.5,
			3.0,
			4.0
      ]
    }, {
      type: 'line',
      label: 'Dataset 2',
      backgroundColor: color(window.chartColors.blue).alpha(0.2).rgbString(),
      borderColor: window.chartColors.blue,
      data: [
    		4.5, 
			4.0,
			2.5,
			3.5,
			3.0,
			4.0
      ]
    
    }]
  };
	var randomScalingFactor = function() {
		return Math.round(Math.random() * 100);
	};

	var config2 = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
				],
				backgroundColor: [
					window.chartColors.red,
					window.chartColors.orange,
					window.chartColors.yellow,
					window.chartColors.green,
					window.chartColors.blue,
				],
				label: 'Dataset 1'
			}],
			labels: [
				'A+',
				'A0',
				'B+',
				'B0',
				'C+'
			]
		},
		options: {
			responsive: true
		}
	};



  window.onload = function() {
	  
	  var ctx2 = document.getElementById('piecanvas').getContext('2d');
		window.myPie = new Chart(ctx2, config2);
	  
	  
    var ctx = document.getElementById('linecanvas').getContext('2d');
    window.myBar = new Chart(ctx, {
      type: 'bar',
      data: barChartData,
  	scales: {
		yAxes: [{
			ticks: {
				stacked: true,
				beginAtZero: true,
				max : 5.0,
				stepSize : 0.5,
				fontSize : 14,
			}
		}],
		xAxes: [{
			stacked: true,
			}]
	},
      options: {
        responsive: true,
        title: {
          display: true,
          text: 'Chart.js Combo Bar Line Chart'
        },
      }
    });
  };
