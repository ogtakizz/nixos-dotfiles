use std::io;

fn main() {

    const SLEEP: f64 = 100.00;
    const AWAKE: f64 = 500.00;

    printf!("Digite quanto tem na sua conta bancária: R$");
    printf!(" ");

    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Falha ao ler a linha");

    let numero: f64 = match input.trim().parse() {
        Ok(num) => num,
        Err(_) => {
            println!("Por favor, digite um número válido!");
            return;
        }
    };

    if numero <= SLEEP {
        println!("Ta fazendo hora extra acordado!");
    } else if numero > SLEEP && numero <= AWAKE {
        println!("Fica comendo seu arroz com ovo em paz!");
    } else {
        println!("Ta todo riquinho(a) né, safado (ou safada)!");
    }
}
