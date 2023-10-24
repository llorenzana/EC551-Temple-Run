use crate::common::*;
use crate::ray::*;
use std::ops::*;

#[derive(Debug, Clone, Copy)]
pub struct Quaternion {
    pub axis: Ray,
    pub angle: Num,
}

impl Quaternion {
    pub fn unit() -> Self {
        Self {
            axis: Ray {
                x: Num::from_num(0.0),
                y: Num::from_num(0.0),
                z: Num::from_num(0.0),
            },
            angle: Num::from_num(1.0),
        }
    }
    pub fn rev(self) -> Self {
        Self {
            axis: self.axis * Num::from_num(-1.0),
            angle: self.angle,
        }
    }
    pub fn dx() -> Self {
        Self {
            axis: Ray {
                x: Num::from_num(0.13052619222005177),
                y: Num::from_num(0.0),
                z: Num::from_num(0.0),
            },
            angle: Num::from_num(0.9914448613738104),
        }
    }
    pub fn dy() -> Self {
        Self {
            axis: Ray {
                x: Num::from_num(0.0),
                y: Num::from_num(0.13052619222005177),
                z: Num::from_num(0.0),
            },
            angle: Num::from_num(0.9914448613738104),
        }
    }
    pub fn dz() -> Self {
        Self {
            axis: Ray {
                x: Num::from_num(0.0),
                y: Num::from_num(0.0),
                z: Num::from_num(0.13052619222005177),
            },
            angle: Num::from_num(0.9914448613738104),
        }
    }
    pub fn rotate(self, ray: Ray) -> Ray {
        let t = self.axis.trunc() * ray.trunc() * Num::from_num(2.0);
        let t = ray.trunc() + t.trunc() * self.angle.trunc() + self.axis.trunc() * t.trunc();
        t.trunc()
    }
}

impl Mul for Quaternion {
    type Output = Self;
    fn mul(self, other: Self) -> Self {
        Self {
            axis: self.axis * other.axis + self.axis * other.angle + other.axis * self.angle,
            angle: self.angle * other.angle - self.axis.dot(other.axis),
        }
    }
}
