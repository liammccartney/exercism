pub fn expected_minutes_in_oven() -> i32 {
    return 40;
}

pub fn remaining_minutes_in_oven(actual_minutes_in_oven: i32) -> i32 {
    return expected_minutes_in_oven() - actual_minutes_in_oven;
}

pub fn preparation_time_in_minutes(number_of_layers: i32) -> i32 {
    return 2 * number_of_layers;
}

pub fn elapsed_time_in_minutes(number_of_layers: i32, actual_minutes_in_oven: i32) -> i32 {
    return preparation_time_in_minutes(number_of_layers) + actual_minutes_in_oven;
}
