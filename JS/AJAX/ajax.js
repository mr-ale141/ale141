send();

async function send() {
  let url = 'http://localhost:3000/JS/AJAX/answer.php';
  let response = await fetch(url);

  if (response.ok) {
    let json = await response.json();
    console.log(json);
  } else {
    console.log("Ошибка HTTP: " + response);
  }
}
