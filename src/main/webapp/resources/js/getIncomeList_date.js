'user strict';

const date = new Date();
let getYear = date.getFullYear();

console.log("getYear : " + getYear);
let incomeYear = document.querySelector('#incomeYear');
let incomeMonth = document.querySelector('#incomeMonth');
console.log(incomeYear);
console.log(incomeMonth);

yearChoice();

function yearChoice() {
	for (var year = 0; year < 5; year++) {
		let options = document.createElement('option');
		options.value += getYear - year;
		options.innerHTML += (getYear - year) + '년';
		incomeYear.appendChild(options);
	}
}