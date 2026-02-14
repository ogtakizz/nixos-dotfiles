use std::io::{self, Write};

fn main() {
    const DURO: bool = true;

    print!("Ta duro ou nao ta?: ");
    io::stdout().flush().expect("Falha ao limpar o buffer");

    let mut input = String::new();

    io::stdin()
        .read_line(&mut input)
        .expect("Digita direito por favor");

    if DURO {
        println!("Dorme");
    } else {
        println!("Dorme")
    }
}
