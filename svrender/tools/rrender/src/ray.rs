use crate::common::Num;
use std::ops::*;

#[derive(Debug, Clone, Copy)]
pub struct Ray {
    pub x: Num,
    pub y: Num,
    pub z: Num,
}

impl Ray {
    pub fn len(self) -> Num {
        Num::from_num((self.dot(self).to_num()).sqrt())
    }
    pub fn trunc(self) -> Self {
        Self {
            x: self.x.trunc(),
            y: self.y.trunc(),
            z: self.z.trunc(),
        }
    }
    pub fn norm(self) -> Self {
        if self.len() == Num::from_num(0.0) {
            Ray {
                x: Num::from_num(1.0),
                y: Num::from_num(0.0),
                z: Num::from_num(0.0),
            }
        } else {
            self / self.len()
        }
    }
    pub fn dot(self, other: Self) -> Num {
        self.x * other.x + self.y * other.y + self.z * other.z
    }
}

impl Add for Ray {
    type Output = Self;
    fn add(self, other: Self) -> Self::Output {
        Self {
            x: self.x + other.x,
            y: self.y + other.y,
            z: self.z + other.z,
        }
    }
}

impl Sub for Ray {
    type Output = Self;
    fn sub(self, other: Self) -> Self::Output {
        Self {
            x: self.x - other.x,
            y: self.y - other.y,
            z: self.z - other.z,
        }
    }
}

impl Div<Num> for Ray {
    type Output = Self;
    fn div(self, rhs: Num) -> Self::Output {
        Self {
            x: self.x / rhs,
            y: self.y / rhs,
            z: self.z / rhs,
        }
    }
}

impl Mul for Ray {
    type Output = Self;
    fn mul(self, rhs: Self) -> Self::Output {
        Self {
            x: self.y * rhs.z - self.z * rhs.y,
            y: self.z * rhs.x - self.x * rhs.z,
            z: self.x * rhs.y - self.y * rhs.x,
        }
    }
}

impl Mul<Num> for Ray {
    type Output = Self;
    fn mul(self, rhs: Num) -> Self::Output {
        Self {
            x: self.x * rhs,
            y: self.y * rhs,
            z: self.z * rhs,
        }
    }
}

impl Mul<u16> for Ray {
    type Output = Self;
    fn mul(self, rhs: u16) -> Self::Output {
        Self {
            x: self.x * rhs,
            y: self.y * rhs,
            z: self.z * rhs,
        }
    }
}

#[derive(Debug, Clone, Copy)]
pub struct FRay {
    pub x: f64,
    pub y: f64,
    pub z: f64,
}

impl FRay {
    pub fn len(self) -> f64 {
        self.dot(self).sqrt()
    }
    pub fn norm(self) -> Self {
        if self.len() == 0.0 {
            return FRay {
                x: 1.0,
                y: 0.0,
                z: 0.0,
            };
        }
        self / self.len()
    }
    pub fn dot(self, other: Self) -> f64 {
        self.x * other.x + self.y * other.y + self.z * other.z
    }
}

impl Add for FRay {
    type Output = Self;
    fn add(self, other: Self) -> Self::Output {
        Self {
            x: self.x + other.x,
            y: self.y + other.y,
            z: self.z + other.z,
        }
    }
}

impl Sub for FRay {
    type Output = Self;
    fn sub(self, other: Self) -> Self::Output {
        Self {
            x: self.x - other.x,
            y: self.y - other.y,
            z: self.z - other.z,
        }
    }
}

impl Mul for FRay {
    type Output = Self;
    fn mul(self, rhs: Self) -> Self::Output {
        Self {
            x: self.y * rhs.z - self.z * rhs.y,
            y: self.z * rhs.x - self.x * rhs.z,
            z: self.x * rhs.y - self.y * rhs.x,
        }
    }
}

impl Div<f64> for FRay {
    type Output = Self;
    fn div(self, rhs: f64) -> Self::Output {
        Self {
            x: self.x / rhs,
            y: self.y / rhs,
            z: self.z / rhs,
        }
    }
}
