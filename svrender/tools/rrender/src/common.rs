use std::ops::*;
type NumT = fixed::FixedI32<fixed::types::extra::U13>;

#[derive(Debug, Clone, Copy, PartialEq, PartialOrd)]
pub struct Num {
    pub num: NumT,
}

impl Num {
    pub fn from_num(src: f32) -> Self {
        Self::new(NumT::from_num(src))
    }
    pub fn print(self) -> String {
        let s = format!("{:032b}", self.num.to_bits());
        s[14..32].to_owned()
    }
    pub fn to_num(self) -> f32 {
        self.num.to_num()
    }
    pub fn trunc(self) -> Self {
        let num = self.num >> 9;
        let num = num << 9;
        Num::new(num)
    }
    pub fn new(num: NumT) -> Self {
        Self { num }
    }
}

impl Add for Num {
    type Output = Self;
    fn add(self, other: Self) -> Self {
        Self::new(self.num + other.num)
    }
}

impl Sub for Num {
    type Output = Self;
    fn sub(self, other: Self) -> Self {
        Self::new(self.num - other.num)
    }
}

impl Mul for Num {
    type Output = Self;
    fn mul(self, other: Self) -> Self {
        Self::new(self.num * other.num)
    }
}

impl Mul<u16> for Num {
    type Output = Self;
    fn mul(self, other: u16) -> Self {
        Self::new(self.num * NumT::from_num(other as f64))
    }
}

impl Div for Num {
    type Output = Self;
    fn div(self, other: Self) -> Self {
        Self::new(self.num / other.num)
    }
}
