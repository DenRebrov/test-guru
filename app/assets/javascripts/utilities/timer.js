document.addEventListener('turbolinks:load', function() {
    var control = document.getElementById('timer');

    if (control) { startTimer(control) }
});

function startTimer(control) {
    var startTime = control.dataset.startTime;
    var endTime = control.dataset.endTime;
    var spentTime = Math.trunc(Date.now() / 1000) - startTime;
    var remainingTime = endTime - spentTime;

    control.innerHTML--;

    if (control.innerHTML == 0) {
        window.location.replace(window.location.href + '/result');
        setTimeout(function(){}, 1000)
    } else {
        setTimeout(startTimer, 1000, control)
    }

    control.innerHTML = remainingTime;
    setTimeout(startTimer, 1000, control)
}
