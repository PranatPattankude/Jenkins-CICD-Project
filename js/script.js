let count = 0;

function increment() {
    count++;
    document.getElementById('counter').innerText = count;
}

function decrement() {
    count--;
    document.getElementById('counter').innerText = count;
}
