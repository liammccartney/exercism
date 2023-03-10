const BASE_RATE: f64 = 221.0;

fn success_rate(speed: u8) -> f64 {
   if 1 <= speed && speed <= 4 {
      return 1.0; 
   } else if 5 <= speed && speed <= 8 {
      return 0.9; 
   } else {
       return 0.77;
   }
}

pub fn production_rate_per_hour(speed: u8) -> f64 {
    return (BASE_RATE * speed as f64) * success_rate(speed);
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    return (production_rate_per_hour(speed) / 60.0) as u32;
}
