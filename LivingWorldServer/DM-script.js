const params = [
    ["Bards College", "Steton Striders"],
    ["Kobold", "Human"],
    ["Dwarf: Hill", "Dwarf: Mountain"],
    ["Krazax", "Dolten"],
    ["Foo", "Bar"]
];

const playerData = [
    { name: "Bob", Faction: "Bards College", Race: "Kobold", Subrace: null, Origin: "Krazax", Suborigin: "Foo" },
    { name: "Bill", Faction: "Bards College", Race: "Human", Subrace: "Dwarf: Hill", Origin: "Dolten", Suborigin: "Foo" },
    { name: "Steve", Faction: "Steton Striders", Race: "Kobold", Subrace: null, Origin: "Krazax", Suborigin: "Bar" }
]

const data = [
    { name: "Bob", page: 1, time: [[0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0]] },
    { name: "Bill", page: 6, time: [[1, 1, 0, 0, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0]] },
    { name: "Steve", page: 12, time: [[1, 1, 1, 1, 1, 1, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 0, 0]] }
]

let reqList = [];
let prefList = [];

const START_OF_CALENDAR = new Date(2020, 11, 27);
const CURRENT_DATE = new Date();
const quarterStart = new Date(START_OF_CALENDAR.getTime() + ((Math.floor((CURRENT_DATE - START_OF_CALENDAR) / 1000 / 60 / 60 / 24 / 7 / 8)) * 56 * 86400000));
const TIME_ZONE = CURRENT_DATE.getTimezoneOffset();
let Month = quarterStart.getMonth();
let Year = quarterStart.getFullYear();
let Day = quarterStart.getDate();
let Page = 1;

function displayParams(filter, paramType) {
    for (let i = 0; i < params.length; i++) {
        params[i].forEach((entryName) => {
            if (paramType === "checkbox") {
                let group = document.createElement('div')
                let name = document.createElement('label');
                name.innerText = entryName;
                name.htmlFor = entryName;

                let entry = document.createElement('input');
                entry.type = paramType;
                entry.name = entryName;
                entry.id = entryName;
                entry.addEventListener('change', (ev) => {
                    filterHeatMap(ev);
                });

                filter[i].appendChild(group);
                group.appendChild(entry);
                group.appendChild(name);
            }
            else if (paramType === 'option') {
                let entry = document.createElement(paramType);
                entry.value = entryName;
                entry.innerText = entryName;
                filter[i].appendChild(entry);
            }
        });
    };
}

function filterHeatMap(ev) {
    let filterParam = ev.target.parentNode.parentNode.innerText.substring(0, ev.target.parentNode.parentNode.innerText.indexOf(':')).toString();
    let filterItem = ev.target.checked ? ev.target.id : "";
    let filteredList = playerData.filter((player) => {return player[filterParam].includes(filterItem);})
    
    clearTimeTable();
    const timeTable = document.querySelector('#Heat-Map table tbody');
    for (let i = 0; i < filteredList.length; i++) {
        fillTimeTable(filteredList[i].time, timeTable.children, i);
    }
}

function nextPage(ev) {
    //Set HeatMap grid to new page
    clearTimeTable();
    Page = (Page + parseInt(ev.target.id) >= 1 && Page + parseInt(ev.target.id) <= 12) ?
        Page + parseInt(ev.target.id) : Page;
    let pageTracker = document.querySelector('#buttons p');
    pageTracker.innerText = `${Page}/12`;
    let newPage = data.filter((x) => {
        return (x.page == Page);
    });
    for (let i = 0; i < newPage.length; i++) {
        fillTimeTable(newPage[i].time, document.querySelectorAll('#Heat-Map table tbody tr'), i);
    }

    //Update Dates in Header
    fillTime((Day + ((Page - 1) * 7)), Month, Year)
}

function fillList(ev, typeList, list) {
    if (!typeList.includes(ev.target.value) && ev.target.value != "Null") {
        typeList.push(ev.target.value);
        let x = document.createElement('div');
        x.innerText = `❌ ${ev.target.value}`;
        x.addEventListener('click', (ev) => {
            typeList.splice(reqList.indexOf(ev.target.value), 1)
            x.remove();
        });
        list.appendChild(x);
    }
}

function checkTime(check_day, month, year) {
    const DAYS_OF_MONTH = [31, year % 4 == 0 ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    while (check_day < 1) {
        month--;
        if (month < 0) {
            month = 11;
            year--;
        }
        check_day += DAYS_OF_MONTH[month];
    }

    while (check_day > DAYS_OF_MONTH[month]) {
        check_day -= DAYS_OF_MONTH[month];
        month++;
        if (month > 11) {
            month = 0;
            year++;
        }
    }

    return `${month + 1}/${check_day}`;
}

function fillTime(day, month, year) {
    const DAYS_OF_WEEK = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    const timeRow = document.querySelectorAll('th');
    for (let i = 0; i < 7; i++) {
        timeRow[i].innerText = `${DAYS_OF_WEEK[i]}\n${checkTime(day, month, year)}`;
        day++;
    };
}

function clearTimeTable() {
    const timeTable = document.querySelectorAll('#Heat-Map table tbody tr');
    timeTable.forEach((row) => {
        for (let i = 0; i < 7; i++) {
            row.children[i].classList.remove('available');
            row.children[i].style.opacity = "";
        };
    });
}

function fillTimeTable(player, gridRows, num) {
    for (let j = 0; j < player.length; j++) {
        for (let i = 0; i < player[j].length; i++) {
            let opacity = parseFloat(gridRows[j].children[i].style.opacity);
            if (player[j][i] == 1) {
                gridRows[j].children[i].classList.add('available');
                if (gridRows[j].children[i].style.opacity == "") {
                    gridRows[j].children[i].style.opacity = ".1";
                }
                else {
                    gridRows[j].children[i].style.opacity = `${opacity + .1}`;
                }
            };
        };
    };
}

document.addEventListener('DOMContentLoaded', () => {
    // Build table
    const timeTable = document.querySelector('#Heat-Map table tbody');
    for (let i = 0; i < (24 * 4); i++) {
        let tableRow = document.createElement('tr');
        tableRow.id = "timeGrid";
        timeTable.appendChild(tableRow);
        for (let j = 0; j < 7; j++) {
            let tableColumn = document.createElement('td');
            tableRow.appendChild(tableColumn);
        };
    };

    // Build Time Header
    fillTime(Day, Month, Year);

    // Adjust Side Time based on Timezone from UTC
    let scale = document.querySelectorAll('#timescale p');
    for(let i = 0; i < scale.length - 2; i++){
        let AMPM = ((Math.floor(i /2) + (TIME_ZONE / 60)) >= 12 && (Math.floor(i /2) + (TIME_ZONE / 60)) < 24) ? 'PM' : 'AM';
        let time = ((Math.floor(i /2) + (TIME_ZONE / 60)) % 12 == 0) ? 12 : (Math.floor(i /2) + (TIME_ZONE / 60)) % 12;
        scale[i + 1].innerText = i % 2 == 0 ? `${time}:00 ${AMPM}` : `${time}:30 ${AMPM}`;
    }

    // Darken areas indicating previous day
    let tableRow = document.querySelectorAll('tbody tr');
    let startDay = Array.from(scale).find( (time) => {return time.innerText === '12:00 AM'});
    let prevDayIndex = Array.from(scale).indexOf(startDay);

    for(let i = 0; i < tableRow.length; i++){
        if(i < prevDayIndex){
            let row = document.querySelectorAll(`tbody tr:nth-child(${i+1}) > td`);
            row.forEach( (td) => {
                td.classList.add("prevDay");
            })
        };
    };
    
    // Build Page Buttons with click event
    buttons = document.querySelectorAll('#buttons button');
    buttons.forEach((x) => {
        x.addEventListener('click', (ev) => {
            nextPage(ev);
        })
    });

    // Fill table with players available times
    let newPage = data.filter((x) => { return (x.page == 1); })
    for (let i = 0; i < newPage.length; i++) {
        fillTimeTable(newPage[i].time, timeTable.children, i);
    }

    // Displays filter 
    const filter = document.querySelectorAll('section#Filter div');
    displayParams(filter, "checkbox");

    // Fill Required Attributes section with filter params
    const req = document.querySelectorAll('#requirement select')
    displayParams(req, 'option');
    req.forEach((x) => {
        x.addEventListener('change', (ev) => {
            fillList(ev, reqList, document.querySelector('#required-list'));
        });
    });

    // Fill Preferred Attributes section with filter params
    const pref = document.querySelectorAll('#preference select')
    displayParams(pref, 'option');
    pref.forEach((x) => {
        x.addEventListener('change', (ev) => {
            fillList(ev, prefList, document.querySelector('#pref-list'));
        });
    });
})