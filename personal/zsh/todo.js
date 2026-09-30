#!/usr/bin/env bun

const TODO = `${process.env.HOME}/BAKHTIAR/note/todo.md`;

const now = new Date();
const TODAY =
    `${now.getFullYear()}-` +
    `${String(now.getMonth() + 1).padStart(2, "0")}-` +
    `${String(now.getDate()).padStart(2, "0")}`;

function showProgress(tasks) {
    const total = tasks.length;

    if (total === 0) {
        return;
    }

    const done = tasks.filter(task =>
        /^- \[[xX]\]/.test(task)
    ).length;

    const percent = Math.floor(done * 100 / total);

    const width = 10;
    const filled = Math.floor(done * width / total);
    const empty = width - filled;

    const bar =
        "█".repeat(filled) +
        "░".repeat(empty);

    console.log(`${bar} ${percent}% (${done}/${total})`);
}

const file = Bun.file(TODO);
const markdown = await file.text();
const lines = markdown.split(/\r?\n/);
let foundToday = false;
const sections = [];
let currentSection = null;


for (const line of lines) {
    // if (line == `# ${TODAY}`) {
    //     foundToday = true;
    //     continue;
    // }

    // if ( foundToday && /^# \d{4}-\d{2}-\d{2}$/.test(line)) {
    //     break;
    // }

    // if (!foundToday) {
    //     continue;
    // }

    if (line.startsWith("## ")) {
        currentSection = {
            title: line,
            tasks: [],
            notes : []
        };


        sections.push(currentSection);
        continue;
    }

    if (line.startsWith("> ")) {
      currentSection.notes.push(line) 
    }


    if ( currentSection && /^- \[[ xX]\]/.test(line)) {
        currentSection.tasks.push(line);
    }
}

console.clear();
console.log("------------------------------------------");

console.log(
    new Date().toLocaleDateString("en-US", {
        weekday: "long",
        day: "2-digit",
        month: "long",
        year: "numeric"
    })
);

console.log("------------------------------------------");
console.log();

for (const section of sections) {

    if (section.tasks.length !== 0 ) {
      console.log(section.title);
    }

    showProgress(section.tasks);


    for (const task of section.tasks) {
        console.log(task);
    }

    // console.log();
    for (const note of section.notes) {
        // console.log(note);
    }

    if (section.tasks.length !== 0 ) {
      console.log();
    }
}


console.log("------------------------------------------");
