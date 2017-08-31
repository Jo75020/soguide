$(document).ready(function() {
var bar = new ProgressBar.SemiCircle(container, {
  strokeWidth: 0,
  color: '#FFEA82',
  trailColor: '#eee',
  trailWidth: 0,
  easing: 'easeInOut',
  duration: 1400,
  svgStyle: null,
  text: {
    value: '',
    alignToBottom: false
  },
  from: {color: '#FFEA82'},
  to: {color: '#ED6A5A'},
  // Set default step function for all animate calls
  step: (state, bar) => {
    bar.path.setAttribute('stroke', state.color);
    var value = Math.round(bar.value() * 16);
    if (value === 0) {
      bar.setText('');
    } else {
      bar.setText(value);
    }

    bar.text.style.color = state.color;
  }
});
bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
bar.text.style.fontSize = '7rem';
bar.text.style.fontWeight = 'bold';

bar.animate(1.0);  // Number from 0.0 to 1.0

var bar = new ProgressBar.SemiCircle(container2, {
  strokeWidth: 0,
  color: '#FFEA82',
  trailColor: '#eee',
  trailWidth: 0,
  easing: 'easeInOut',
  duration: 1400,
  svgStyle: null,
  text: {
    value: '',
    alignToBottom: false
  },
  from: {color: '#FFEA82'},
  to: {color: '#ED6A5A'},
  // Set default step function for all animate calls
  step: (state, bar) => {
    bar.path.setAttribute('stroke', state.color);
    var value = Math.round(bar.value() * 100);
    if (value === 0) {
      bar.setText('');
    } else {
      bar.setText(value);
    }

    bar.text.style.color = state.color;
  }
});
bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
bar.text.style.fontSize = '7rem';
bar.text.style.fontWeight = 'bold';

bar.animate(1.0);  // Number from 0.0 to 1.0

var bar = new ProgressBar.SemiCircle(container3, {
  strokeWidth: 0,
  color: '#FFEA82',
  trailColor: '#eee',
  trailWidth: 0,
  easing: 'easeInOut',
  duration: 1400,
  svgStyle: null,
  text: {
    value: '',
    alignToBottom: false
  },
  from: {color: '#FFEA82'},
  to: {color: '#ED6A5A'},
  // Set default step function for all animate calls
  step: (state, bar) => {
    bar.path.setAttribute('stroke', state.color);
    var value = Math.round(bar.value() * 1000);
    if (value === 0) {
      bar.setText('');
    } else {
      bar.setText(value);
    }

    bar.text.style.color = state.color;
  }
});
bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
bar.text.style.fontSize = '7rem';
bar.text.style.fontWeight = 'bold';

bar.animate(1.0);  // Number from 0.0 to 1.0







});
