const express = require("express");
const hbs = require("hbs");
const wax = require("wax-on");

// the '/promise ==> allow us to use the await/async 
const mysql = require("mysql2/promise");

let app = express();
app.set("view engine", "hbs");
app.use(express.static("public"));
wax.on(hbs.handlebars);
wax.setLayoutPath("./views/layouts");

app.use(express.urlencoded({ extended: false }));

async function main() {
    // create sql connection
    const connection = await mysql.createConnection({
        // host is usually  
        'host':'localhost',
        'user':'root',
        'database':'sakila'

    });

    // let query = "SELECT * FROM actors";
    // // the syntax below is known as ARRAY DESTRUCTURING
    // let [actors] = await connection.execute("SELECT * FROM actor");
    // // instead of
    // // let response = await connection.execute("SELECT * FROM actor");
    // // let actors = response[0];
    // // for (let a of actors) {
    // //     console.log(a);
    // // }
    // console.log(actors.toJSON())

    let query = 'SELECT * from actor';
    app.get('/actors', async (req,res) => {
        let [actors] = await connection.execute(query);
        res.render('actors', {
            'actors':actors
        })
    })

}

main()

require("handlebars-helpers")({
  handlebars: hbs.handlebars,
});

// ROUTES BEGIN HERE

app.listen(3000, () => {
  console.log("Server started");
});