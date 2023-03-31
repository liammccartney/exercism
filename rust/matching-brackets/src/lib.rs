pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack: Vec<char> = vec![];

    for x in string.chars() {
        match x {
            '(' => stack.push(x),
            '[' => stack.push(x),
            '{' => stack.push(x),
            ')' => match stack.pop() {
                Some(y) => {
                    if y != '(' {
                        stack.push(x)
                    }
                }
                None => stack.push(x),
            },
            ']' => match stack.pop() {
                Some(y) => {
                    if y != '[' {
                        stack.push(x)
                    }
                }
                None => stack.push(x)
            },
            '}' => match stack.pop() {
                Some(y) => {
                    if y != '{' {
                        stack.push(x)
                    }
                }
                None => stack.push(x),
            },
            _ => (),
        }
    }
    return stack.len() == 0;
}
