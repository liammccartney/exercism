pub fn reverse(input: &str) -> String {
    let mut result = String::from("");
    for c in input.chars() {
        result.insert_str(0, &c.to_string());
    }
    return result.to_string();
}
