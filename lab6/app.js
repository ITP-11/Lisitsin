"use strict";

let div = document.getElementById("tableDiv");
let btn = document.getElementById("btn");

let process = [];
let processN = +prompt("Введите количество процессов: ");

for (let i = 0; i < processN; i++)
{
    let priority = prompt("Введите приоритеты процессов: ");
    let duration = prompt("Продолжительность процессов: ");

    process.push({priority, duration, remained: duration, appearance: "", isCompleted: false, states: []});
}

let table = [];
let statesN = [];
let wAmount = 0, eAmount = 0;

let isPrEx = false, f = false;
let numOfExPr = 0;
let q = 0;

btn.addEventListener("click", (e) => 
{
    if (process.some(el => !el.isCompleted))
    {
        f = false;

        if (!isPrEx) 
        {
            let processQ = findQprocess(process);
            isPrEx = true;
            process = putStates(process, processQ, numOfExPr);

            process[numOfExPr].remained--;
        } 
        else if (isPrEx && process[numOfExPr].remained)
        {
            let processQ = findQprocess(process);

            process = putStates(process, processQ, numOfExPr);

            process[numOfExPr].remained--;
        }
        else if (isPrEx && !process[numOfExPr].remained)
        {
            process[numOfExPr].isCompleted = true;

            console.log(`Process with priority ${process[numOfExPr].priority} is over!\n`);

            isPrEx = false;
            numOfExPr++;
            f = true;
        }

        div.innerHTML = "";
        showQuantTable(div, process, q);

        if (!f) {
            if (isPrEx)
                console.log(`Process with priority ${process[numOfExPr].priority} is executing!`);

            statesN.push(q++);
        }
    } else
        showTable();
});

btn.click();

function findQprocess(process) {
    let arr = [];

    process.filter((pr, i) => !pr.isCompleted && arr.push({pr, i}));
    
    return arr;
}
function putStates(process, processQ, numOfExPr)
{
    process.forEach((el, i) => 
    {
        if (i != numOfExPr && !processQ.some(e => e.i == i)) 
            el.states.push(" ");
        else if (i != numOfExPr && processQ.some(e => e.i != i))
            el.states.push("W");
        else if (i == numOfExPr && !el.isCompleted)
            el.states.push("E");
    });

    return process;
}

function showQuantTable(el, process, q)
{
    let str1 = ["#", 'Priority', 'Duration', 'Remained'];

    let b = document.createElement("b");
    b.innerHTML = `Current quant is ${q}`;

    el.append(b);
    el.append(document.createElement("br"));

    let table = document.createElement("table");
    let thead = document.createElement("thead");
    let tbody = document.createElement("tbody");

    table.style.borderCollapse = "collapse";
    table.setAttribute("border", "1");

    str1.forEach((el) => {
        let td = document.createElement("td");

        td.innerHTML = el;

        thead.append(td);
    })

    process.forEach((el, ind) => {
        let tr = document.createElement("tr");
        let td = document.createElement("td");

        td.innerHTML = ind;

        tr.append(td);

        Object.values(el).slice(0, 3).forEach((propName) => 
        {
            let td = document.createElement("td");

            td.innerHTML = propName;

            tr.appendChild(td);
        });

        tbody.append(tr);
    })

    table.append(tbody);
    table.append(thead);

    el.append(table);
}

function showTable() 
{
    table.push(["#", ...statesN]);

    let t = document.createElement("table");
    let thead = document.createElement("thead");
    let tbody = document.createElement("tbody");

    t.style.borderCollapse = "collapse";
    t.setAttribute("border", "1");

    let tr = document.createElement("tr");

    table[0].forEach((el) => {
        let td = document.createElement("td");

        td.innerHTML = el;

        tr.append(td);
    })

    thead.append(tr);
    t.append(thead);

    for (let i = 0; i < process.length; i++)
    {
        let tr = document.createElement("tr");

        let td = document.createElement("td");

        td.innerHTML = process[i].priority;

        tr.append(td);

        
        process[i].states.forEach((state) => {
            td = document.createElement("td");

            td.innerHTML = state;

            tr.append(td);
        });

        tbody.append(tr);
    }

    t.append(tbody);

    document.body.appendChild(t);
}
