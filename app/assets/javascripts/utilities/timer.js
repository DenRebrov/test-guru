document.addEventListener('turbolinks:load', function() {
    var control = document.getElementById('timer');

    if (control) { startTimer(control) }
});

function startTimer(control) {
    var x = setInterval(function() {

        var startTime = control.dataset.startTime;
        var endTime = control.dataset.endTime;
        var spentTime = Math.trunc(Date.now() / 1000) - startTime;
        var remainingTime = endTime - spentTime;

        control.innerHTML--;

        if (control.innerHTML == 0) {
            clearInterval(x)
            window.location.replace(window.location.href + '/result');
        }

        control.innerHTML = remainingTime;
    }, 1000)
}
