// "use strict";

// let input = '';
// const apiUrl = 'https://www.wikitable2json.com/api/'

// const setup = () => {
//   noCanvas();
//   input = select('#input');
//   input.changed(search);
// }

// const search = () =>{
//   let url = apiUrl + input.value();
//   loadJSON(url, show, 'jsonp');

// }

// const show = (data) => {
//   let links = data.query.backlinks;
//   links.forEach(link => {
//     createDiv(link.title);
//   });
// }

let input = '';
const searchUrl = 'https://ja.wikipedia.org/w/api.php?action=query&format=json&list=backlinks&bllimit=50&bltitle='

function setup() {
  noCanvas();
  input = select('#input');
  input.changed(search);
}

function search() {
  let url = searchUrl + input.value();
  loadJSON(url, show, 'jsonp');
}

function show(data) {
  let links = data.query.backlinks;
  links.forEach(link => {
    createDiv(link.title);
  });

}