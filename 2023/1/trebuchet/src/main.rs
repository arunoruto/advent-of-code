use std::fs;
use std::collections::HashMap;
use regex::Regex;

// fn print_type_of<T>(_: &T) {
//     println!("{}", std::any::type_name::<T>())
// }

fn main() {
    let numbers = HashMap::from([
        ("one",   1),
        ("two",   2),
        ("three", 3),
        ("four",  4),
        ("five",  5),
        ("six",   6),
        ("seven", 7),
        ("eight", 8),
        ("nine",  9),
    ]);

    let data = fs::read_to_string("input.txt").expect("Unable to read file");

    let mut acc = 0;
    
    for line in data.lines() {
        let mut new_line = vec![0; line.len()];

        // If the character is a digit, replace it with the digit in the new line
        for (i, l) in line.chars().enumerate() {
            if l.is_digit(10) {
                new_line[i] = l.to_digit(10).unwrap();
            }
        }

        // For each character position, place the corresponding number in the new line
        // This helps with "overlapping" numbers like oneight -> 1188888
        // Multiple matches are possible, so we need to use find_iter from regex
        for (key, value) in numbers.iter() {
            let re = Regex::new(key).unwrap();
            let matches: Vec<_> = re.find_iter(line).collect();
            for m in matches {
                new_line.splice(m.start()..m.end(), vec![*value; key.len()]);
            }
        }

        // Remove all 0s from the new line
        new_line.retain(|&x| x != 0);
        // println!("{:?}", new_line);

        let first = new_line.first().copied().unwrap();
        let last = new_line.last().copied().unwrap();
        let digits = first * 10 + last;

        acc += digits;
        // println!("{:?}", digits);
    }

    println!("Accumulator: {}", acc);
}