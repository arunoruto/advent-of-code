use std::fs;
use std::cmp;
use std::collections::HashMap;
use regex::Regex;

fn main() {
    // let mut list = Vec::new();
    let limits = HashMap::from([
        ("red",   12),
        ("green", 13),
        ("blue",  14),
    ]);
    let game_id_re = Regex::new(r"Game (\d+): (.?+)").unwrap();
    let balls_re = Regex::new(r"(\d+) (\w+)").unwrap();

    let data = fs::read_to_string("input.txt").expect("Unable to read file");
    let data: Vec<&str> = data.split("\n").collect();
    let mut game_sum = 0;
    let mut power_sum = 0;
    for d in data {
        let game_data = game_id_re.captures(d).unwrap();
        let id   = game_data.get(1).unwrap().as_str();
        let sets = game_data.get(2).unwrap().as_str();
        let sets: Vec<_> = sets.split("; ").map(|x| x.split(", ").collect::<Vec<_>>()).collect();

        // println!("Game ID: {}", id);
        let mut valid = true;
        let mut mins = HashMap::from([
            ("red",   0),
            ("green", 0),
            ("blue",  0),
        ]);
        for set in sets {
            for balls in set {
                let balls_data = balls_re.captures(balls).unwrap();
                let number = balls_data.get(1).unwrap().as_str().parse::<i32>().unwrap();
                let color  = balls_data.get(2).unwrap().as_str();
                if number > *limits.get(color).unwrap() {
                    valid = false;
                }

                let bigger = cmp::max(number, *mins.get(color).unwrap());
                *mins.get_mut(color).unwrap() = bigger;
            }
        }

        if valid {
            game_sum += id.parse::<i32>().unwrap();
        }

        let mut product = 1;
        for (_, v) in mins {
            product *= v;
        }
        power_sum += product;
        
        // list.push(

        // );
    }

    println!("Sum of the game IDs: {}", game_sum);
    println!("Sum of powers: {}", power_sum);
}