const playerBank = document.querySelector("#bank");

function apriBanca() {
  document.querySelector(".container").style.display = "block";
}

window.addEventListener("message", function (event) {
  let data = event.data;
  if (data.type === "apriBanca") {
    apriBanca();

    playerBank.innerText = `$ ${event.data.soldi}`;
  }

  if (data.type === "apriAtm") {
    apriAtm();

  }
});

function post(path) {
  fetch(path, {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify({}),
  }).then((resp) => resp.json());
}

//Funzione ritira
function ritira() {
  fetch(`https://${GetParentResourceName()}/ritira`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify({
      importo: document.querySelector("#ritira").value,
    }),
  }).then((resp) => resp.json());

  document.querySelector("#ritira").value = "";
}

//Funzione deposita
function deposita() {
  fetch(`https://${GetParentResourceName()}/deposita`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify({
      importo: document.querySelector("#deposita").value,
    }),
  }).then((resp) => resp.json());

  document.querySelector("#deposita").value = "";
}

//Funzione trasferire
function trasferire() {
  fetch(`https://${GetParentResourceName()}/trasferire`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: JSON.stringify({
      importo: document.querySelector("#trasfe2").value,
      id: document.querySelector("#trasfe1").value,
    }),
  }).then((resp) => resp.json());

  document.querySelector("#trasfe1").value = "";
  document.querySelector("#trasfe2").value = "";
}

//Funzione Chiudi
document.onkeydown = function (evt) {
  evt = evt || window.event;
  var isEscape = false;
  if ("key" in evt) {
    isEscape = evt.key === "Escape" || evt.key === "Esc";
  } else {
    isEscape = evt.keyCode === 27;
  }
  if (isEscape) {
    
    post(`https://${GetParentResourceName()}/chiudi`);
    document.querySelector(".container").style.display = "none";
  }
};
