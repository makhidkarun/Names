// main.rs
//
// Example from:   https://docs.rs/sqlite/latest/sqlite/#

// Needs the following dependencies in Cargo.toml:
//   sqlite = "0.34.0"
//   rand = "0.8.5"

use rand::seq::SliceRandom;
use rand::thread_rng;
use sqlite::State;

fn get_name(gender: &str) -> String {
    let connection = sqlite::open("data/names.db").unwrap();

    let mut first_name: String = String::from(" ");
    let mut last_name: String = String::from(" ");

    let mut query = "SELECT * FROM humaniti_last ORDER BY RANDOM() LIMIT 1";
    let mut statement = connection.prepare(query).unwrap();

    while let Ok(State::Row) = statement.next() {
        last_name = statement.read::<String, _>("name").unwrap().to_string();
    }

    if gender == "f" {
        query = "SELECT * FROM humaniti_female_first ORDER BY RANDOM() LIMIT 1";
    } else {
        query = "SELECT * FROM humaniti_male_first ORDER BY RANDOM() LIMIT 1";
    }
    statement = connection.prepare(query).unwrap();
    while let Ok(State::Row) = statement.next() {
        first_name = statement.read::<String, _>("name").unwrap().to_string();
    }

    format!("{first_name} {last_name}")
}

fn gen_gender() -> String {
    let options = ["m", "f"];
    let mut rng = thread_rng();
    return (*options.choose(&mut rng).expect("Can't choose")).to_string();
}

fn main() {
    println!("{}", get_name(&gen_gender()));
}
