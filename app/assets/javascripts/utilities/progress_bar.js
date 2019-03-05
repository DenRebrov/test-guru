document.addEventListener('turbolinks:load', function () {
    var control = document.querySelector('#start_progress_bar');

    if (control) { control.addEventListener('click', addProgress()) }
});

function addProgress() {
    var progress = document.querySelector('#start_progress_bar').dataset.progress;

    document.querySelector('.bar').style.width = progress + '%'
}