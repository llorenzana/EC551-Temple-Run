use crate::common::Num;
use crate::ray::*;

#[derive(Debug)]
pub struct Triangle {
    pub points: [Ray; 3],
    pub normal: Ray,
}

impl Triangle {
    pub fn new(points: [Ray; 3]) -> Self {
        let normal = ((points[2] - points[0]) * (points[1] - points[0])).norm();
        Self { points, normal }
    }
    pub fn intersect(&self, camera: Ray, direction: Ray) -> (bool, Num, Num) {
        let k = direction.dot(self.normal) > Num::from_num(0.0);
        let edge1 = if k { self.points[1] } else { self.points[2] } - self.points[0];
        let edge2 = if !k { self.points[1] } else { self.points[2] } - self.points[0];
        let h = direction * edge2;
        let a = edge1.dot(h);
        let s = camera - self.points[0];
        let u = s.dot(h);
        if u < Num::from_num(0.0) || u > a {
            return (false, Num::from_num(0.0), Num::from_num(0.0));
        }
        let q = s * edge1;
        let v = direction.dot(q);
        if v < Num::from_num(0.0) || u + v > a {
            return (false, Num::from_num(0.0), Num::from_num(0.0));
        }
        let t = edge2.dot(q);
        return (t > Num::from_num(0.0), t, a);
    }
}

#[derive(Debug)]
pub struct FTriangle {
    pub points: [FRay; 3],
    pub normal: FRay,
}

impl FTriangle {
    pub fn new(points: [FRay; 3]) -> Self {
        let normal = ((points[2] - points[0]) * (points[1] - points[0])).norm();
        Self { points, normal }
    }
}
